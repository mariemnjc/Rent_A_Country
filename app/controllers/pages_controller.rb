class PagesController < ApplicationController
  before_action :authenticate_user!

  def profil
    @countries = current_user.countries.includes(:bookings)

    @stats = @countries.map do |country|
      {
        country: country,
        total_requests: country.bookings.count,
        approved_requests: country.bookings.where(status: true).count,
        rejected_requests: country.bookings.where(status: false).count
      }
    end
  end
end
