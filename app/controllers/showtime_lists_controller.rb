class ShowtimeListsController < ApplicationController

  def index
    @theater = Theater.find(params[:theater_id])
    @date =
      if params.key?(:date)
        Date.strptime(params[:date], '%m/%d/%Y')
      else
        Date.today
      end
    @showtime_list = @theater.showtime_lists.for(@date)
  end

end
