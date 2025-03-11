class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :continent
      t.string :language
      t.string :climate
      t.string :description
      t.string :resources
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
