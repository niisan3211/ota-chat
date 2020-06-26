class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :genru
  has_many :comments
  has_many :images,dependent: :destroy
  has_many :likes
  has_many :users, through: :likes

  validates :text,  presence: true,
                    length: { maximum: 280}
  

  accepts_nested_attributes_for :images, allow_destroy: true
  # ↑fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド
  # allow_destroy: true は親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除することを許可している
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
