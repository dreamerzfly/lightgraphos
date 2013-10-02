class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :brand
      t.string :component
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end
