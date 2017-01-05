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

  end

end
