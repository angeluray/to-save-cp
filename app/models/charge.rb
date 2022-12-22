class Charge < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  has_many :relations
  has_many :groups, through: :relations
end
