class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,password_length: 7..128

  validates :name, presence: true, uniqueness: true

  has_many :users_genrus,dependent: :destroy
  has_many :genrus, through: :users_genrus
  has_many :users_groups,dependent: :destroy
  has_many :groups, through: :users_groups
  has_many :groups
  accepts_nested_attributes_for :groups, allow_destroy: true
  has_many :tweets,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :tweets,through: :likes

  mount_uploader :icon, ImageUploader

  validate :valid_email?
  validate :password_complexity

  def valid_email?
    return if email.blank? || email =~ /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    # blank?はblankであれば"true"でblankでなければ"flase"を返す
    # ||は"または"であり左側が"false"なら右側を"return"する
    # つまり"email.blank?"が"false(ブランクではない)"場合、"email"を正規表現にかけるということになる
  end
  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{7,70}$/
    # blank?-値がない状態がture
    errors.add :password, "は英字と数字をそれぞれ1文字以上含める必要があります"
    # password.blank? || password =~ のどちらも"false"だからエラーになり、エラー表示される
  end

end
