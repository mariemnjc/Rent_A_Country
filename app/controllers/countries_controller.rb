class CountriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def country_params
    params(:country).permit(:name, :user_id, :continent, :language, :climate, :description, :resources)
  end
end
