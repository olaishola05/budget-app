class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :category
  has_many :transact

  validates :name, presence: true, length: { in: 6..25 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }


  ROLES = %i[admin member moderator manager].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

end
