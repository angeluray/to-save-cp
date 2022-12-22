class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :relations, foreign_key: :group_id, dependent: :destroy
  has_many :charges, through: :relations, foreign_key: :group_id, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
