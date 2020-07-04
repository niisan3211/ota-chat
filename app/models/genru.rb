class Genru < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_one :users_genrus,dependent: :destroy
  has_many :users, through: :users_genrus
  has_one :tweets, dependent: :destroy
  has_one :groups, dependent: :destroy

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
