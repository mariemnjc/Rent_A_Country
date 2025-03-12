class Country < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image

  RESOURCES_LIST = %w[
    Pétrole Or Charbon Bois Eau-douce Tourisme Technologie Agriculture Industrie
    Pêche Gaz-naturel Diamants Énergies-renouvelables Métaux-rares Fer Soja Cacao Platine
    Zinc Nickel Uranium Élevage Coton Sucre Maïs(blé) Argent Lithium
    ].freeze

  validates :name, presence: true, uniqueness: true
  validates :continent, :language, :climate, :description, :resources, presence: true
  validates :resources, inclusion: { in: RESOURCES_LIST }
end
