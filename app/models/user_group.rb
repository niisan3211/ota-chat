class UserGroup < ApplicationRecord
  belongs_to :user
  has_on :group
end
