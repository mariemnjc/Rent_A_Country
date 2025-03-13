class Country < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image
  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true },
      trigram: { threshold: 0.2 }
    }

  RESOURCES_LIST = %w[
    Pétrole Or Charbon Bois Eau-douce Tourisme Technologie Agriculture Industrie
    Pêche Gaz-naturel Diamants Énergies-renouvelables Métaux-rares Fer Soja Cacao Platine
    Zinc Nickel Uranium Élevage Coton Sucre Maïs(blé) Argent Lithium
    ].freeze

  validates :name, presence: true, uniqueness: true
  validates :capital, presence: true
  validates :continent, :language, :climate, :description, :resources, presence: true
  validate :resources_must_be_valid

  def resources_must_be_valid
    if resources.any? { |r| !RESOURCES_LIST.include?(r) }
      errors.add(:resources, "contient des valeurs non valides")
    end
  end

  geocoded_by :new_address
  after_validation :geocode, if: :will_save_change_to_name?

  def new_address
  "#{name} #{capital}"
  end

  def index
    @countries = Country.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @countries.geocoded.map do |country|
    {
      lat: country.latitude,
      lng: country.longitude
    }
    end
  end
end
