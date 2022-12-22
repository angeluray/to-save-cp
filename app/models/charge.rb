class Charge < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  has_many :relations, foreign_key: :charge_id, dependent: :destroy
  has_many :groups, through: :relations, foreign_key: :charge_id

  validates :name, presence: true
  validates :amount, presence: true
end
