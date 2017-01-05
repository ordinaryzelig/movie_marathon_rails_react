class TheatersController < ApplicationController

  def index
  end

  def search
    @theaters = Theater.search(params[:zipcode])
  end

end
