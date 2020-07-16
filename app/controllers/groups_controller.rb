class GroupsController < ApplicationController

  def new
    @group = Group.new
    @genru = Genru.find(params[:genru_id])

    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @group = Group.new(params_group)
    if @group.valid?
      @group.save
      redirect_to genru_path(@group.genru_id)
    else
      redirect_to new_genru_group_path(@group.genru_id)
    end
  end

  def show
    @group = Group.find(params[:id])
    user = User.find(current_user.id)
    @groups = user.user_groups
  end

  private

  def params_group
    user_ids = params["user_ids"]
    if user_ids == nil
      params.permit(:name,:ota_rank,:comment).merge(genru_id: params[:genru_id])
    else
      user_ids << current_user.id
      params.permit(:name,:ota_rank,:comment).merge(genru_id: params[:genru_id],user_ids: user_ids)
    end
  end

end
