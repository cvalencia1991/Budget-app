class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  has_many :groups, dependent: :destroy
  validates :amount, presence: true
  validates :name, presence: true
end
