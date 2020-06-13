class Genru < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :users, through: :users_genrus
  has_many :tweets
  has_many :groups


  def self.search(search)
    if search
      Genru.where()
    else
      Genru.all
    end
  end
end
