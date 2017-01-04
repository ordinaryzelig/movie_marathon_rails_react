class Theater < ApplicationRecord

  class << self

    def search(zipcode)
      hashes = Fandango.movies_near(zipcode)

      hashes.map do |hash|
        theater_hash = hash.fetch(:theater)

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
