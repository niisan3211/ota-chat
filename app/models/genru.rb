class Genru < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :users_genrus
  has_many :users, through: :users_genrus
  has_many :tweets
  has_many :groups

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search
      Genru.where()
    else
      Genru.all
    end
  end
end
