class UsersGenru < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genru, optional: true
end
