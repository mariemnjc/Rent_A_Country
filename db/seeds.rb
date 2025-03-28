RESOURCES_LIST = %w[
  Pétrole Or Charbon Bois Eau-douce Tourisme Technologie Agriculture Industrie
  Pêche Gaz-naturel Diamants Énergies-renouvelables Métaux-rares Fer Soja Cacao Platine
  Zinc Nickel Uranium Élevage Coton Sucre Maïs(blé) Argent Lithium
].freeze

puts "Nettoyage de la base de données..."
Booking.destroy_all
Country.destroy_all
User.destroy_all
puts "Base nettoyée !"

# === Création des présidents et utilisateurs ===
puts "Création des présidents..."
presidents = {
  "France" => "Emmanuel Macron",
  "États-Unis" => "Donald Trump",
  "Russie" => "Vladimir Poutine",
  "Chine" => "Xi Jinping",
  "Royaume-Uni" => "Rishi Sunak",
  "Allemagne" => "Olaf Scholz",
  "Brésil" => "Luiz Inácio Lula da Silva",
  "Inde" => "Narendra Modi",
  "Canada" => "Justin Trudeau",
  "Japon" => "Fumio Kishida",
  "Italie" => "Giorgia Meloni",
  "Espagne" => "Pedro Sánchez",
  "Mexique" => "Andrés Manuel López Obrador",
  "Australie" => "Anthony Albanese",
  "Argentine" => "Javier Milei",
  "Afrique du Sud" => "Cyril Ramaphosa",
  "Corée du Sud" => "Yoon Suk-yeol",
  "Arabie Saoudite" => "Mohammed ben Salmane",
  "Turquie" => "Recep Tayyip Erdoğan",
  "Égypte" => "Abdel Fattah al-Sissi",
  "Israël" => "Benjamin Netanyahou",
  "Ukraine" => "Volodymyr Zelensky",
  "Iran" => "Ebrahim Raïssi",
  "Pakistan" => "Shehbaz Sharif",
  "Indonésie" => "Joko Widodo",
  "Nigéria" => "Bola Tinubu",
  "Pologne" => "Andrzej Duda",
  "Pays-Bas" => "Mark Rutte",
  "Grèce" => "Kyriakos Mitsotakis",
  "Suède" => "Ulf Kristersson",
  "Norvège" => "Jonas Gahr Støre",
  "Finlande" => "Petteri Orpo",
  "Danemark" => "Mette Frederiksen",
  "Autriche" => "Karl Nehammer",
  "Suisse" => "Alain Berset",
  "Colombie" => "Gustavo Petro",
  "Chili" => "Gabriel Boric",
  "Gaza (Palestine)" => "Yahya Sinwar",
  "Groenland" => "Múte Bourup Egede"
}

users = {}
presidents.each do |country, president|
  users[country] = User.create!(
    email: "#{president.downcase.gsub(" ", ".")}@gov.com",
    password: "password",
    name: president
  )
end

puts "Présidents créés !"

puts "Création des pays..."

countries_data = [
  { name: "France", capital: "Paris", description: "France", continent: "Europe", climate: "Tempéré", language: "Français", resources: RESOURCES_LIST.sample(3), price: 500_000, user: users["France"] },
  { name: "États-Unis", capital: "Whashington DC", description: "USA", continent: "Amérique du Nord", climate: "Varié", language: "Anglais", resources: RESOURCES_LIST.sample(3), price: 3_000_000, user: users["États-Unis"] },
  { name: "Russie", capital: "Moscou", description: "Russie", continent: "Eurasie", climate: "Froid", language: "Russe", resources: RESOURCES_LIST.sample(3), price: 2_500_000, user: users["Russie"] },
  { name: "Chine", capital: "Pékin", description: "Chine", continent: "Asie", climate: "Varié", language: "Mandarin", resources: RESOURCES_LIST.sample(3), price: 3_500_000, user: users["Chine"] },
  { name: "Ukraine", capital: "Kiev", description: "Ukraine", continent: "Europe", climate: "Tempéré", language: "Ukrainien", resources: RESOURCES_LIST.sample(3), price: 250_000, user: users["Ukraine"] },
  { name: "Israël", capital: "Tel-Aviv", description: "Israël", continent: "Asie", climate: "Aride", language: "Hébreu", resources: RESOURCES_LIST.sample(3), price: 700_000, user: users["Israël"] },
  { name: "Palestine", capital: "Gaza", description: "Palestine", continent: "Asie", climate: "Méditerranéen", language: "Arabe", resources: RESOURCES_LIST.sample(3), price: 100_000, user: users["Gaza (Palestine)"] },
  { name: "Groenland", capital: "Nuuk", description: "Groenland", continent: "Amérique", climate: "Glacial", language: "Groenlandais", resources: RESOURCES_LIST.sample(3), price: 50_000, user: users["Groenland"] }
]

# Générer 32 autres pays en utilisant des ressources valides aléatoires
# other_countries = [
#   ["Suède", "Europe", "Froid", "Suédois"],
#   ["Norvège", "Europe", "Froid", "Norvégien"],
#   ["Brésil", "Amérique du Sud", "Tropical", "Portugais"],
#   ["Inde", "Asie", "Varié", "Hindi"],
#   ["Canada", "Amérique du Nord", "Froid", "Anglais, Français"],
#   ["Mexique", "Amérique du Nord", "Tropical", "Espagnol"],
#   ["Australie", "Océanie", "Aride", "Anglais"],
#   ["Argentine", "Amérique du Sud", "Tempéré", "Espagnol"]
# ]

# other_countries.each do |name, continent, climate, language|
#   countries_data << {
#     name: name,
#     continent: continent,
#     climate: climate,
#     language: language,
#     resources: RESOURCES_LIST.sample(3), # 🔥 Sélectionne 3 ressources aléatoires valides
#     price: rand(5_000..100_000),
#     user: users.values.sample
#   }
# end

# # 🔍 Vérifie que toutes les ressources sont bien valides
# countries_data.each do |country|
#   country[:resources] = country[:resources].select { |r| RESOURCES_LIST.include?(r) }
# end

countries_data.map { |country| Country.create!(country) }

puts "#{Country.count} pays créés !"

# === Création des réservations ===
puts "Création des réservations..."
bookings_data = [
  { user: users["Russie"], country: Country.find_by(name: "Ukraine"), arrival_date: "2022-02-24", departure_date: "2025-12-31", status: "pending", price: 10_000 },
  { user: users["États-Unis"], country: Country.find_by(name: "Groenland"), arrival_date: "2020-08-15", departure_date: "2025-12-31", status: "pending", price: 100_000 },
  { user: users["Israël"], country: Country.find_by(name: "Palestine"), arrival_date: "2023-10-07", departure_date: "2025-12-31", status: "pending", price: 50_000 }
]

bookings_data.each { |booking| Booking.create!(booking) }

puts "Réservations créées avec prix !"
