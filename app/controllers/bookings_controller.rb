class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.country = current_country
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end
end
