class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups, dependent: :destroy
  has_many :transactions, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
end
