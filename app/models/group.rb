class Group < ApplicationRecord
  belongs_to :genru
  belongs_to :user

  has_many :messages,dependent: :destroy
  has_many :users_groups,dependent: :destroy
  has_many :users, through: :users_groups

  # has_one :through と has_and_belongs_to_many

  # has_and_belongs_to_manyは中間テーブルを挟んだ１対１のみの中間テーブル
  # モデルがない
  # has_one :through は中間テーブル自体を対応することができる(推奨)
  # モデルがある

  acts_as_taggable
  # acts_as_taggable_on :tags　と同じ意味のエイリアス
  # tags のなかにIDやら名前などが入る。イメージ的には親情報。

  validates :name, presence: true,uniqueness: true
  validates :comment,presence: true

  enum ota_ranks: {ライト:0, ミドル:1, ハード:2}
end
