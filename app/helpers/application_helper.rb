module ApplicationHelper
  # Liste des ressources disponibles
  RESOURCES_LIST = %w[
    Pétrole Or Charbon Bois Eau-douce Tourisme Technologie Agriculture Industrie
    Pêche Gaz-naturel Diamants Énergies-renouvelables Métaux-rares Fer Soja Cacao Platine
    Zinc Nickel Uranium Élevage Coton Sucre Maïs(blé) Argent Lithium
  ].freeze

  # Association des ressources avec des émojis
  RESOURCE_EMOJIS = {
    "Pétrole" => "🛢️",
    "Or" => "🥇",
    "Charbon" => "⛏️",
    "Bois" => "🌲",
    "Eau-douce" => "💧",
    "Tourisme" => "🌍",
    "Technologie" => "💻",
    "Agriculture" => "🌾",
    "Industrie" => "🏭",
    "Pêche" => "🎣",
    "Gaz-naturel" => "🔥",
    "Diamants" => "💎",
    "Énergies-renouvelables" => "⚡",
    "Métaux-rares" => "🪙",
    "Fer" => "🔩",
    "Soja" => "🌱",
    "Cacao" => "🍫",
    "Platine" => "🏆",
    "Zinc" => "🛠️",
    "Nickel" => "🎛️",
    "Uranium" => "☢️",
    "Élevage" => "🐄",
    "Coton" => "🧵",
    "Sucre" => "🍬",
    "Maïs(blé)" => "🌽",
    "Argent" => "💰",
    "Lithium" => "🔋"
  }.freeze

  # Helper pour afficher un filtre avec émoji
  def resource_filter_link(resource)
    link_to countries_path(resources: [resource]), class: "resource-filter btn btn-outline-primary mx-2 d-flex flex-column align-items-center" do
      content_tag(:span, RESOURCE_EMOJIS[resource], class: "emoji fs-3") +
      content_tag(:span, resource, class: "text small")
    end
  end
end
