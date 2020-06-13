class Genru < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :users, through: :users_genrus

  def self.search(search)
    if search
      Genru.where()
    else
      Genru.all
    end
  end
end
