class Theater < ApplicationRecord

  has_many :showtime_lists do

    def for(date)
      showtime_list = find_or_initialize_by(
        :date => date,
      )
      showtime_list.refresh if showtime_list.new_record? || showtime_list.stale?
      showtime_list
    end

  private

    def theater
      proxy_association.owner
    end

  end

  class << self

    def search(zipcode)
      hashes = Fandango.movies_near(zipcode)

      hashes.map do |theater_hash|
        theater = Theater.find_or_initialize_by(
          :remote_id => theater_hash.fetch(:id),
        )

        unless theater.persisted?
          theater.attributes = {
            :name => theater_hash.fetch(:name),
          }
          theater.save!
        end

        theater
      end
    end

    def parse(parsed)
      parsed.fetch('theaters').map do |theater_hash|
        theater = create!(
          :name => theater_hash.fetch('name'),
          :remote_id => theater_hash.fetch('id'),
        )

        parse_showtime_list(theater, theater_hash)

        theater
      end
    end

  private

    def parse_showtime_list(theater, theater_hash)
      theater.showtime_lists.create!(
        :date   => Date.parse(theater_hash.fetch('displayDate')),
        :movies => parse_movies(theater_hash),
      )
    end

    def parse_movies(theater_hash)
      theater_hash.fetch('movies').map do |movie_hash|
        {
          :title => movie_hash.fetch('title'),
          :runtime => movie_hash.fetch('runtime'),
          :showtimes => movie_hash.fetch('variants').fetch(0).fetch('amenityGroups').fetch(0).fetch('showtimes').map do |showtime_hash|
            {
              :datetime => DateTime.parse(showtime_hash.fetch('ticketingDate')),
            }
          end,
        }
      end
    end

  end

end
