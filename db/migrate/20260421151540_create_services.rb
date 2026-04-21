class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :price
      t.integer :duration
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
