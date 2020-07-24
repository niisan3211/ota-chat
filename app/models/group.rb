class Group < ApplicationRecord
  belongs_to :genru
  belongs_to :user

  has_many :messages,dependent: :destroy
  has_many :user_groups,dependent: :destroy
  has_many :users, through: :user_groups
  acts_as_taggable
  # acts_as_taggable_on :tags　と同じ意味のエイリアス
  # tags のなかにIDやら名前などが入る。イメージ的には親情報。
  
  # has_many :group_tags,dependent: :destroy
  # has_many :tags, through: :group_tags
  # accepts_nested_attributes_for :group_tags
  # accepts_nested_attributes_for :user_groups, allow_destroy: true
  # accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, presence: true,uniqueness: true
  validates :comment,presence: true

  enum ota_ranks: {ライト:0, ミドル:1, ハード:2}
end
