# Category Model for table Categories
# Contains any validation & how it relates to other tables
class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :title
end
