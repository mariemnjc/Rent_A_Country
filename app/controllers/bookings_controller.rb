class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]


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
    if params[:status].present?
      @booking.update(status: ActiveModel::Type::Boolean.new.cast(params[:status]))
      message = @booking.status ? "Réservation acceptée ✅" : "Réservation refusée ❌"
      redirect_to profil_bookings_path, notice: message
    else
      redirect_to profil_bookings_path, alert: "Action invalide."
    end
  end
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
