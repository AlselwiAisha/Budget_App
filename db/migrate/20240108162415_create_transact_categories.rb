class CreateTransactCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :transact_categories do |t|
      t.references :transacts, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
