class TransactCategory < ApplicationRecord
    t.references :transact, null: false, foreign_key: true
    t.references :Category, null: false, foreign_key: true
    
end
