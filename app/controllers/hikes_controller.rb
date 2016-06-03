class HikesController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @hikes = @location.hikes
  end

  def show
    @hike = Hike.find(params[:id])
    @location = @hike.location
  end

  def new
    @location = Location.find(params[:location_id])
    @hike = @location.hikes.new
  end

  def create
    @location = Location.find(params[:location_id])
    @hike = @location.hikes.new(hike_params)
    if @hike.save
      redirect_to location_hike_path(@location, @hike)
    else
      render :new
    end
  end

  private

  def hike_params
    params.require(:hike).permit(
      :date_hiked,
      :route,
      :distance,
      :elevation_gain,
      :highest_point,
      :description
    )
  end
end
