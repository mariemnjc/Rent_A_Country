class ChangeResourcesToArrayInCountries < ActiveRecord::Migration[7.1]
  def change
    remove_column :countries, :resources, :string
    add_column :countries, :resources, :text, array: true, default: []
  end
end
