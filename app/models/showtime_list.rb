class ShowtimeList < ApplicationRecord

  belongs_to :theater

  class << self

    def fetch(theater, date = Date.today)
      Fandango.theater_showtimes(
        :theater_id => theater.remote_id,
        :date       => date,
      )
    end

  end

  def refresh
    update!(
      :movies => self.class.fetch(theater, date)
    )
  end

  def stale?
    1.hour.ago > updated_at
  end

end
