class User < ApplicationRecord
  has_many :countries
  has_many :bookings
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
end
