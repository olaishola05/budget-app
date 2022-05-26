class Category < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validates :icon, presence: true, length: { maximum: 200}

    belongs_to :user
    has_many :transact

    def most_recent
        user = current_user
        categories = Category.include(:transact).where(user_id: user.id).order(created_at: :desc)
    end

    def most_ancient
        user = current_user
        categories = Category.include(:transact).where(user_id: user.id).order(created_at: :asc)
    end
end
