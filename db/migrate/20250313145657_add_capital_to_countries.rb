class AddCapitalToCountries < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :capital, :string
  end
end
