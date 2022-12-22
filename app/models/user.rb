class User < ApplicationRecord
  has_many :groups, foreign_key: :user_id, dependent: :destroy
  has_many :charges, foreign_key: :author_id, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
