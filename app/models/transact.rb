class Transact < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :transact_categories, dependent: :destroy
  has_many :categories, through: :transact_categories

  validates :author_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :at_least_one_category

  private

  def at_least_one_category
    errors.add(:base, 'Please select at least one category') if categories.empty?
  end
end
