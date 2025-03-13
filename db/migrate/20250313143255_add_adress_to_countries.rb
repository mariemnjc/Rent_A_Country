class AddAdressToCountries < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :address, :string
  end
end
