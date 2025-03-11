class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :arrival_date, :departure_date, presence: true
end
