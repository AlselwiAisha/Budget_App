class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transacts, foreign_key: 'author_id', dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
end
