class ShowtimeList < ApplicationRecord

  class << self

    def fetch(theater, date = Date.today)
      Fandango.theater_showtimes(
        :theater_id => theater.remote_id,
        :date       => date,
      )
    end

  end

end
