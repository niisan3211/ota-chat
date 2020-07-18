class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :message_images,dependent: :destroy

  validates :message, presence: true,unless: :message_image?
  mount_uploader :message_image, ImageUploader

end
