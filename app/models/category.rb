class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 6..30 }
  validates :icon, presence: true, length: { in: 6..200 }

  belongs_to :user
  has_many :transact
end
