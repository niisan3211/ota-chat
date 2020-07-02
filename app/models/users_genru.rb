class UsersGenru < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genru, optional: true

  def to_partial_path
    'users_genrus/users_genru'
  end

end
