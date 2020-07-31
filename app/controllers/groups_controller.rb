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
      redirect_to genru_group_path(genru_id: @group.genru_id,id: @group.id)
    else
      redirect_to new_genru_group_path(id: @group.genru_id) and return 
    end
  end

  def edit
    @group = Group.find(params[:id])
    @user_ids = @group.users.ids
    @members = User.where(id: @user_ids)
    @not_members = User.where.not(id: @user_ids)
    @hope = Hope.new
    @hope_dones = Hope.where(group: @group.id)

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
    group = Group.find(params[:id])
    group.messages.each do |message|
      message.delete
    end
    hope = Hope.find_by(group: group.id)
    if hope 
      hope.destroy
    end
    group.destroy
    group.users.delete
    redirect_to genru_path(params[:genru_id])
  end

  def show
    @group = Group.find(params[:id])
    user = User.find(current_user.id)
    @groups = current_user.users_groups
    @messages = Message.where(group_id: params[:id])
    @message = Message.new
  end

  private

  def params_group
    user_ids = params["user_ids"]
    if user_ids == nil
      params.require(:group).permit(:name,:ota_rank,:comment).merge(user_id: current_user.id,genru_id: params[:genru_id],user_ids: current_user.id)
    else
      user_ids << current_user.id
      params.require(:group).permit(:name,:ota_rank,:comment).merge(user_id: current_user.id,genru_id: params[:genru_id],user_ids: user_ids)
    end
  end

  def update_group
    @group = Group.find(params[:id])
    if params[:group][:group]
      @ids = params[:group][:group][:ids]
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
    else
      @box = []
      @box << @group.user_id.to_s
      user_ids = @box
    end
    # params.require(:group).permit(:name,:ota_rank,:comment,:genru_id,:user_id,{user_ids: user_ids})
    params.require(:group).permit(:name,:ota_rank,:comment,:tag_list).merge(user_id: @group.user_id,genru_id: @group.genru_id,user_ids: user_ids)
  end

end
