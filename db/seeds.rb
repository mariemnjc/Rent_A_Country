puts "Nettoyage de la base de données..."
Booking.destroy_all
Country.destroy_all
User.destroy_all
puts "Base nettoyée !"

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
    email: "#{president.downcase.gsub(/\s/, '.')}@gov.com",
    password: "password",
    name: president
  )
end

puts "Présidents créés !"

puts "Création des pays..."
countries_data = [
  { name: "France", continent: "Europe", climate: "Tempéré", language: "Français", resources: "Vins, blé, énergie nucléaire", price: 500_000_000 },
  { name: "États-Unis", continent: "Amérique du Nord", climate: "Varié", language: "Anglais", resources: "Pétrole, technologie, maïs", price: 3_000_000_000 },
  { name: "Russie", continent: "Eurasie", climate: "Froid", language: "Russe", resources: "Gaz naturel, pétrole, minerais", price: 2_500_000_000 },
  { name: "Chine", continent: "Asie", climate: "Varié", language: "Mandarin", resources: "Terres rares, charbon, riz", price: 3_500_000_000 },
  { name: "Ukraine", continent: "Europe", climate: "Tempéré", language: "Ukrainien", resources: "Blé, charbon, fer", price: 250_000_000 },
  { name: "Israël", continent: "Asie", climate: "Aride", language: "Hébreu", resources: "Gaz naturel, technologie", price: 700_000_000 },
  { name: "Gaza (Palestine)", continent: "Asie", climate: "Méditerranéen", language: "Arabe", resources: "Pêche, agriculture", price: 100_000_000 },
  { name: "Groenland", continent: "Amérique", climate: "Glacial", language: "Groenlandais", resources: "Glace, minerais, pêche", price: 50_000_000 },
]

# Génération de 32 pays fictifs pour arriver à 40
while countries_data.size < 40
  countries_data << {
    name: Faker::Address.country,
    continent: ["Europe", "Asie", "Afrique", "Amérique du Nord", "Amérique du Sud", "Océanie"].sample,
    climate: ["Tropical", "Tempéré", "Aride", "Froid"].sample,
    language: Faker::Nation.language,
    resources: Faker::Commerce.product_name,
    price: rand(10_000_000..5_000_000_000)
  }
end

# Création des pays avec leur propriétaire (owner)
countries = countries_data.map do |country|
  owner = users[country[:name]] || users.values.sample
  Country.create!(country.merge(owner: owner))
end

puts "Pays créés !"

puts "Création des réservations..."
bookings_data = [
  { user: users["Russie"], country: countries.find { |c| c.name == "Ukraine" }, arrival_date: "2022-02-24", departure_date: "2025-12-31", status: "pending", price: countries.find { |c| c.name == "Ukraine" }.price },
  { user: users["États-Unis"], country: countries.find { |c| c.name == "Groenland" }, arrival_date: "2020-08-15", departure_date: "2025-12-31", status: "pending", price: countries.find { |c| c.name == "Groenland" }.price },
  { user: users["Israël"], country: countries.find { |c| c.name == "Gaza (Palestine)" }, arrival_date: "2023-10-07", departure_date: "2025-12-31", status: "pending", price: countries.find { |c| c.name == "Gaza (Palestine)" }.price }
]

bookings_data.each do |booking|
  Booking.create!(booking)
end

puts "Réservations créées avec prix !"
