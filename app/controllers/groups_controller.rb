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

  def edit
    @group = Group.find(params[:id])
    @user_id = @group.user_groups.pluck(:user_id)
    @members = User.where(id: @user_id)
    @not_members = User.where.not(id: @user_id)
    @users = @group.user_groups.ids

    return nil if params[:keyword] == ""
    @search_members = @not_members.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.valid?
      @group.update(update_group)
      redirect_to genru_group_path(genru_id: @group.genru_id,id: @group.id)
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.messages.destroy
    @group.destroy
    redirect_to genru_path(params[:genru_id])
  end

  def show
    @group = Group.find(params[:id])
    user = User.find(current_user.id)
    @groups = user.user_groups
    @messages = Message.where(group_id: params[:id])
    @message = Message.new
  end

  private

  def params_group
    user_ids = params["user_ids"]
    if user_ids == nil
      params.permit(:name,:ota_rank,:comment).merge(user_id: current_user.id,genru_id: params[:genru_id],user_ids: current_user.id)
    else
      user_ids << current_user.id
      params.permit(:name,:ota_rank,:comment).merge(user_id: current_user.id,genru_id: params[:genru_id],user_ids: user_ids)
    end
  end

  def update_group
    @group = Group.find(params[:id])
    @ids = params[:group][:user_group][:ids]
    @box = []
    @ids.delete("0")
    for id in @ids
      id = id.delete("{:checked_value=>, :unchecked_value=>false}")
      @box << id
    end
    @box
    @box=@box.compact
    unless @box.include?(@group.user_id.to_s)
      @box << @group.user_id.to_s
    end
    user_ids = @box
    # params.require(:group).permit(:name,:ota_rank,:comment,:genru_id,:user_id,{user_ids: user_ids})
    params.require(:group).permit(:name,:ota_rank,:comment,:tag_list).merge(user_id: @group.user_id,genru_id: @group.genru_id,user_ids: user_ids)
  end

end
