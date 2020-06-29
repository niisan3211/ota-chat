class UsersGenrusController < ApplicationController
  before_action :set_item

  def create
    @favorite = current_user.users_genrus.build(genru_id: params[:genru_id])
    if @favorite.save
      respond_to do |format|
        format.html {redirect_to genru_path(id: params[:genru_id]) and return}
        format.json
      end
    else
      render genru_path(id: params[:genru_id]) and return
    end
  end

  def destroy
    favorite = UsersGenru.find_by(genru_id: params[:genru_id],user_id: current_user.id)
    if favorite.destroy
      redirect_to genru_path(id: params[:genru_id]) and return
    else
      render genru_path(id: params[:genru_id]) and return
    end
  end
  private
  def set_item
    @genru = Genru.find_by(params[:genru_id])
  end
end
