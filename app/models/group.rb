class Group < ApplicationRecord
  belogns_to :genru

  # has_many :tweets
  has_many :users, through: :users_groups
end
