class AddReferencesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :listing, null: false, foreign_key: true
    add_reference :bookings, :reservation, null: false, foreign_key: true
  end
end
