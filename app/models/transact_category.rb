class TransactCategory < ApplicationRecord  
  belongs_to :transact
  belongs_to :category
  
  validates :category_id, presence: true
  validates :transact_id, presence: true
end
