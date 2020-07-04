class Like < ApplicationRecord
  has_one :user
  has_one :tweet
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
