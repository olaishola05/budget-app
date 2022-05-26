class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string # add a column to the users table called name
    add_column :users, :role, :string, :default => "member" # add a column to the users table called role, with a default value of "member"
  end
end
