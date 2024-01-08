class Transact < ApplicationRecord
    belongs_to :user, class_name: 'author', foreign_key: 'author_id'
    has_and_belongs_to_many :categories, join_table: 'transact_categories', dependent: :destroy
  
    validates :author_id, presence: true
    validates :name, presence: true
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end