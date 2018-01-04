# Restaurant Model for table restaurants
# Contains any validation & how it relates to other tables
class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :address1, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :postcode, presence: true, length: { minimum: 3, maximum: 10 }
end
