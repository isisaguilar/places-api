class PlacesController < ApplicationController

  def index
    places = Place.all
    render json: places
  end

  def create
    place = Place.new(
      name:params[:name],
      address:params[:address]
    )
    if place.save
      render json: place
    else
      render json: place.errors.full_messages
    end
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end


  def update
    place = Place.find(params[:id])
    place.update(
      name:params[:name],
      address:params[:address]
    )
    if place.save
      render json: place
    else
      render json: place.errors.full_messages
    end
  end


  def destroy
    place = Place.find(params[:id])
    place.delete
    render json: {message:"The place has been destroyed"}
  end

end
