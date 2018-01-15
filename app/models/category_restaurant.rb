# Category Model for table Category_Restaurants
# Contains any validation & how it relates to other tables
class CategoryRestaurant < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
end
