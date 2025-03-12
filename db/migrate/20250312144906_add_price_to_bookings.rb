class AddPriceToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :price, :integer, null: false, default: 0
  end
end
