class GroupsController < ApplicationController
  def index
  end

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
    binding.pry
    if @group.save
      redirect_to genru_path(@group.genru_id)
    else
      render :new
    end
  end

  def show
  end

  private

  def params_group
    params.require(:group).permit(:name,:ota_rank,:comment,users_ids:[],tags_id:[]).merge(genru_id: params[:genru_id])
  end

end
