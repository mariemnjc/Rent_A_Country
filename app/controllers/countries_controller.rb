class CountriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @countries = Country.all
    @country = Country.new
  end

  def show
    @country = Country.find(params[:id])
    @booking = Booking.new
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    @country.user = current_user

    if @country.save
      redirect_to country_path(@country), notice: "Pays créé avec succès !"
    else
      puts @country.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def country_params
    params.require(:country).permit(:name, :capital, :user_id, :continent, :language, :climate, :description, :image, resources: [])
  end
end
