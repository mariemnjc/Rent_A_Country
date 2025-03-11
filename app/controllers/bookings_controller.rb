class BookingsController < ApplicationController
  def index
    countries = Country.where(user_id: current_user.id)
    @bookings = Booking.where(country: countries)
  end

  # à mettre dans def index admin ?

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
