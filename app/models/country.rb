class Country < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :continent, :language, :climate, :description, :resources, presence: true

end
