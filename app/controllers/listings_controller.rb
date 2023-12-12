class ListingsController < ApplicationController

  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = Listing.all

    render json: @listings
  end

  def show
    render json: @listing
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing, status: created, location: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    head :no_content
  end


  private

  def listing_params
    params.require(:listing).permit(:num_room)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
