class TheatersController < ApplicationController

  def index
  end

  def search
    @theaters = Theater.search(params[:zipcode])
  end

  def parse
    @theaters = Theater.parse(MultiJson.load(params[:json]))
    render :search
  end

end
