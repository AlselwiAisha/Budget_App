class Category < ApplicationRecord
    belongs_to :user, class_name: 'user', foreign_key: 'user_id'
    has_and_belongs_to_many :transacts, join_table: 'transact_categories', dependent: :destroy
  
    validates :user_id, presence: true
    validates :name, presence: true
    validates :icon, presence: true
end
