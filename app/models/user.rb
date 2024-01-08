class User < ApplicationRecord
    has_many :transacts, class_name: 'author', foreign_key: 'author_id', dependent: :destroy
    has_many :categories, dependent: :destroy
  
    validates :name, presence: true
end
