class HomesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @groups = @user.users_groups
  end
  
  def show
    @genrus = Genru.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @hope_hopes = Hope.where(hope: current_user.id)
    # current_userが参加希望をしているグループ用のレコードを出す↑
    @hope_groups= Hope.where(group_reader: current_user.id)
    # current_userがグループリーダーのグループ用のレコードを出す↑
    
  end
  

end
