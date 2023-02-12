class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :transactions, dependent: :destroy
  has_one_attached :icon
end
