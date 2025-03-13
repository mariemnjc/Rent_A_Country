class AddPriceToCountries < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :price, :integer
  end
end
