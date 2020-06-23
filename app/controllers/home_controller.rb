class HomeController < ApplicationController
  def index
    @genrus = Genru.where(user_id: current_user.id)
  end
end
