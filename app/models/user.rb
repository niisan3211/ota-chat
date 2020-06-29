class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true

  has_many :users_genrus,dependent: :destroy
  has_many :genrus, through: :users_genrus
  has_many :groups,through: :users_groups
  has_many :tweets,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :tweets,through: :likes
end
