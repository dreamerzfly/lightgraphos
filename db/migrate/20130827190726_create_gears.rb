class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :user_id
      t.string :title
      t.string :brand
      t.string :component
      t.float :daily_rental_price
      t.string :description

      t.timestamps
    end
    add_index :gears, [:user_id]
  end
end
