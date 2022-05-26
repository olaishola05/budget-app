class AddUserRefToTransacts < ActiveRecord::Migration[7.0]
  def change
    add_reference :transacts, :user, null: false, foreign_key: true
  end
end
