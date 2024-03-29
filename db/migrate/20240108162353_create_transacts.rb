class CreateTransacts < ActiveRecord::Migration[7.1]
  def change
    create_table :transacts do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      
      t.timestamps
    end
  end
end
