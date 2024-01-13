class Category < ApplicationRecord
  belongs_to :user
  has_many :transact_categories, dependent: :destroy
  has_many :transacts, through: :transact_categories

  validates :user_id, presence: true
  validates :name, presence: true
  validates :icon, presence: true
end
