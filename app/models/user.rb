# User Model for table users
# Contains any validation & how it relates to other tables
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
  validates :username, length: { minimum: 3 }, uniqueness: true
  validates :tel, length: { in: 11..12 }

  def full_name
    [first_name, last_name].join(' ')
  end
end
