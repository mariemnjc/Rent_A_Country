class CountriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @countries = Country.all
    @country = Country.new

    if params[:query].present?
      @countries = @countries.search_by_name_and_description(params[:query])
    end

    if params[:continent].present?
      @countries = @countries.where(continent: params[:continent])
    end

    if params[:climate].present?
      @countries = @countries.where(climate: params[:climate])
    end

    if params[:language].present?
      @countries = @countries.where(language: params[:language])
    end

    if params[:resources].present?
      selected_resources = params[:resources].reject(&:blank?)
      @countries = @countries.where("resources @> ARRAY[?]::text[]", selected_resources)
    end

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
