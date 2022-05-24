class AddCategoryToReferenceUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, index: true
  end
end
