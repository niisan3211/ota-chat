class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true

  has_one  :users_genru
  has_many :genrus, through: :users_genru
  has_many :groups,through: :users_groups
  has_many :tweets
end
