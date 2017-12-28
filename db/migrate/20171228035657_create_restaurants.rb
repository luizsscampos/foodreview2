class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |restaurant|
      restaurant.string :name
      restaurant.text :description
      restaurant.string :address1
      restaurant.string :address2
      restaurant.string :city
      restaurant.string :county
      restaurant.string :postcode
      restaurant.timestamps
    end
  end
end
