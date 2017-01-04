class TheatersController < ApplicationController

  def search
    theaters = Theater.search(params[:zipcode])
    render :json => theaters
  end

end
