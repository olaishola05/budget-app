class CreateTransacts < ActiveRecord::Migration[7.0]
  def change
    create_table :transacts do |t|
      t.string :name
      t.integer :amount
      t.string :categories
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
