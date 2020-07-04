class Group < ApplicationRecord
  belongs_to :genru

  has_many :messages,dependent: :destroy
  has_many :user_groups,dependent: :destroy
  has_many :users, through: :user_groups
  has_many :group_tags,dependent: :destroy
  has_many :tags, through: :group_tags

  accepts_nested_attributes_for :tags, allow_destroy: true
  enum ota_rank: {ライト:1, ミドル:2, ハード:3}
end
