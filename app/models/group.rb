class Group < ApplicationRecord
  belongs_to :genru

  has_many :messages,dependent: :destroy
  has_many :user_groups,dependent: :destroy
  has_many :users, through: :user_groups
  has_many :group_tags,dependent: :destroy
  has_many :tags, through: :group_tags

  validates :name, presence: true,uniqueness: true
  validates :comment,presence: true

  accepts_nested_attributes_for :tags, allow_destroy: true
  enum ota_ranks: {ライト:0, ミドル:1, ハード:2}
end
