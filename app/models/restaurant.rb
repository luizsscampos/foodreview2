# Restaurant Model for table restaurants
# Contains any validation & how it relates to other tables
class Restaurant < ApplicationRecord
  has_many :category_restaurants
  has_many :categories, through: :category_restaurants, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :address1, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :postcode, presence: true, length: { minimum: 3, maximum: 10 }

  def full_address
    address = [address1, address2, city, county, postcode]
    address.reject! { |part| part.strip.empty? }
    address.join(', ')
  end
end
