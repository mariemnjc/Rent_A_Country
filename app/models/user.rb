class User < ApplicationRecord
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :countries
  has_many :bookings
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
end
