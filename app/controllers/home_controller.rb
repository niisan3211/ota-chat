class HomeController < ApplicationController
  def index
    @genrus = Genru.where(user_id: current_user.id)
    user = User.find(current_user.id)
    @groups = user.user_groups
  end
end
