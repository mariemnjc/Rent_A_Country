class Country < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image

  RESOURCES_LIST = %w[
    Pétrole Or Charbon Bois Eau-douce Tourisme Technologie Agriculture Industrie
    Pêche Gaz-naturel Diamants Énergies-renouvelables Métaux-rares Fer Soja Cacao Platine
    Zinc Nickel Uranium Élevage Coton Sucre Maïs(blé) Argent Lithium
    ].freeze

  validates :name, presence: true, uniqueness: true
  validates :continent, :language, :climate, :description, :resources, presence: true
  validate :resources_must_be_valid

  def resources_must_be_valid
    if resources.any? { |r| !RESOURCES_LIST.include?(r) }
      errors.add(:resources, "contient des valeurs non valides")
    end
  end
end
