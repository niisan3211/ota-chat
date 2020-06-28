class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
