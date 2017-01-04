class Theater < ApplicationRecord

  class << self

    def search(zipcode)
      hashes = Fandango.movies_near(zipcode)
      hashes.map do |hash|
        theater_hash = hash.fetch(:theater)
        theater = Theater.find_or_initialize_by(
          :remote_id => theater_hash.fetch(:id),
        )
        theater.save!(
          :name => theater_hash.fetch(:name),
        ) unless theater.persisted?
        theater
      end
    end

  end

end
