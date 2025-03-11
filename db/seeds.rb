# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
Country.destroy_all
User.destroy_all

User.create!([
  { name: "Emmanuel Macron", email: "emmanuel_macron@gov.com", password: "password123" },
  { name: "Joe Biden", email: "joe_biden@gov.com", password: "password123" },
  { name: "Xi Jinping", email: "xi_jinping@gov.com", password: "password123" },
  { name: "Vladimir Poutine", email: "vladimir_poutine@gov.com", password: "password123" },
  { name: "Angela Merkel", email: "angela_merkel@gov.com", password: "password123" },
  { name: "Narendra Modi", email: "narendra_modi@gov.com", password: "password123" },
  { name: "Justin Trudeau", email: "justin_trudeau@gov.com", password: "password123" },
  { name: "Jair Bolsonaro", email: "jair_bolsonaro@gov.com", password: "password123" },
  { name: "Shinzo Abe", email: "shinzo_abe@gov.com", password: "password123" },
  { name: "Boris Johnson", email: "boris_johnson@gov.com", password: "password123" },
  { name: "Recep Tayyip Erdoğan", email: "recep_tayyip_erdogan@gov.com", password: "password123" },
  { name: "Moon Jae-in", email: "moon_jae_in@gov.com", password: "password123" },
  { name: "Cyril Ramaphosa", email: "cyril_ramaphosa@gov.com", password: "password123" },
  { name: "Alberto Fernández", email: "alberto_fernandez@gov.com", password: "password123" },
  { name: "Andrés Manuel López Obrador", email: "andres_lopez_obrador@gov.com", password: "password123" },
  { name: "Scott Morrison", email: "scott_morrison@gov.com", password: "password123" },
  { name: "Pedro Sánchez", email: "pedro_sanchez@gov.com", password: "password123" },
  { name: "Giuseppe Conte", email: "giuseppe_conte@gov.com", password: "password123" },
  { name: "Alexander De Croo", email: "alexander_de_croo@gov.com", password: "password123" },
  { name: "Mark Rutte", email: "mark_rutte@gov.com", password: "password123" }
])

users = User.all


Country.create!([
  { name: "Atlantis", continent: "Océanie", language: "Anglais", climate: "Tropical", description: "Île légendaire au climat parfait.", resources: "Eau douce, Or, Tourisme", user_id: users.sample.id },
  { name: "El Dorado", continent: "Amérique du Sud", language: "Espagnol", climate: "Tempéré", description: "La cité d’or perdue.", resources: "Or, Pétrole, Forêts", user_id: users.sample.id },
  { name: "Shangri-La", continent: "Asie", language: "Mandarin", climate: "Montagnard", description: "Un paradis caché entre les montagnes.", resources: "Eau douce, Pêche, Thé", user_id: users.sample.id },
  { name: "Zanzibarland", continent: "Afrique", language: "Swahili", climate: "Tropical", description: "Un pays avec des plages de rêve.", resources: "Tourisme, Agriculture, Épices", user_id: users.sample.id },
  { name: "Nova Scotia", continent: "Amérique du Nord", language: "Anglais", climate: "Froid", description: "Des forêts et des lacs infinis.", resources: "Bois, Poissons, Hydroélectricité", user_id: users.sample.id },
  { name: "New Camelot", continent: "Europe", language: "Anglais", climate: "Océanique", description: "Un royaume mythique et moderne.", resources: "Technologie, Industrie, Pêche", user_id: users.sample.id },
  { name: "Pangea Prime", continent: "Monde", language: "Multilingue", climate: "Varié", description: "La fusion ultime de toutes les cultures.", resources: "Innovation, Science, Commerce", user_id: users.sample.id },
  { name: "Valhalla", continent: "Europe", language: "Vieux Norrois", climate: "Froid", description: "Terre des dieux nordiques.", resources: "Or, Métaux rares, Hydroélectricité", user_id: users.sample.id },
  { name: "Utopia", continent: "Inconnu", language: "Tous", climate: "Tempéré", description: "Un pays modèle de paix et d’harmonie.", resources: "Énergie renouvelable, Éducation, Innovation", user_id: users.sample.id },
  { name: "Lemuria", continent: "Océanie", language: "Tamoul", climate: "Tropical", description: "Un ancien continent submergé.", resources: "Tourisme, Pétrole, Agriculture", user_id: users.sample.id }
])

countries = Country.all


Booking.create!([
    { arrival_date: "2025-04-10", departure_date: "2025-04-20", status: true, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-05-05", departure_date: "2025-05-15", status: false, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-06-01", departure_date: "2025-06-10", status: true, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-07-15", departure_date: "2025-07-25", status: false, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-08-20", departure_date: "2025-09-01", status: true, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-10-05", departure_date: "2025-10-15", status: true, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-11-01", departure_date: "2025-11-10", status: false, user_id: users.sample.id, country_id: countries.sample.id },
    { arrival_date: "2025-12-20", departure_date: "2026-01-05", status: true, user_id: users.sample.id, country_id: countries.sample.id }
])
