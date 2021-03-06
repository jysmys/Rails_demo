class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, length: { maximum: 20 }
  validates :name, presence: true
  validates_uniqueness_of :name

  validates :encrypted_password, length: { minimum: 6 }
  validates :encrypted_password, presence: true
  
end
