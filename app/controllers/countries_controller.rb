class CountriesController < ApplicationController
  def index
    @countries = Country.all
    @countries = Country.new
  end

  def show
    @country = Country.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
