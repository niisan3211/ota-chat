class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :genru
  has_many :comments

  validates :text,  presence: true, unless: :image?
  validates :image, presence: true, unless: :text?

  mount_uploader :image, ImageUploader
end
