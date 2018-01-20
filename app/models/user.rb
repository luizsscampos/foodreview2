# User Model for table users
# Contains any validation & how it relates to other tables
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def full_name
    [first_name, last_name].join(' ')
  end
end
