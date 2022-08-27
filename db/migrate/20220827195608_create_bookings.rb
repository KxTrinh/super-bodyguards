class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_rent
      t.date :end_rent
      t.references :user, null: false, foreign_key: true
      t.references :heros, null: false, foreign_key: true

      t.timestamps
    end
  end
end
