class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :total_amount
      t.integer :status
      t.datetime :time_slot

      t.timestamps
    end
  end
end
