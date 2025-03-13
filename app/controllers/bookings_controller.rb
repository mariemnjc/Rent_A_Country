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
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @country = Country.find(params[:country_id].to_i)
    @user = current_user
    @booking.country = @country
    @booking.user = @user
    if @booking.save
      redirect_to profil_bookings_path, notice: "Réservation créée avec succès !"
    else
      render "countries/show", status: :unprocessable_entity
    end
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

  def my_reservations
    @bookings = current_user.bookings.includes(:country) # Charge les pays associés pour éviter les requêtes N+1
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
