class CreateCategoryRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :category_restaurants do |t|
      t.integer :category_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
