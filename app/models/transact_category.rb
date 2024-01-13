class TransactCategory < ApplicationRecord
  belongs_to :transact
  belongs_to :category

  validates :category_id, uniqueness: { scope: :transact_id }
end
