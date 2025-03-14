class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    # Récupérer toutes les ressources des pays appartenant à l'utilisateur
    @resources = Hash.new(0)
    @resource_countries = Hash.new { |hash, key| hash[key] = [] }

    @user.countries.each do |country|
      country.resources.each do |resource|
        @resources[resource] += rand(0.01..0.1).round(4) # Simule un revenu en Bitcoin
        @resource_countries[resource] << country.name
      end
    end

    # Calcul du solde en banque et forecast N+1
    @bank_balance = @resources.values.sum.round(4)
    @forecast_next_month = (@bank_balance * 1.15).round(4) # Prévision +15% croissance
  end
end
