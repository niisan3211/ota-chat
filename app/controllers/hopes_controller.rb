class HopesController < ApplicationController
  def create
    @hope = Hope.new(hope_params)
    if @hope.valid?
      @hope.save
      redirect_to genru_path(id: params[:genru_id])
    else
      render edit_genru_group_path(genru_id: params[:genru_id],id: params[:group_id])
    end
  end

  def destroy
    group = Group.find(params[:group])
    user_ids = group.user_ids
    user_ids.push(params[:hope])
    if group.update(user_ids: user_ids)
      hope = Hope.find(params[:id])
      hope.destroy
      redirect_to homes_path
    else
      render homes_path
    end
  end

  def edit
    
  end

  def update
    hope = Hope.find(params[:id])
    hope.update(pass_fail: 1)
    redirect_to homes_path
  end

  private

  def hope_params
    @hope = params[:hope][:hope]
    @group = params[:hope][:group]
    @group_reader = params[:hope][:group_reader]
    @comment = params[:hope][:comment]
    @hope = @hope.delete("{:checked_value=>}")
    @group = @group.delete("{:checked_value=>}")
    @group_reader = @group_reader.delete("{:checked_value=>}")
    params.require(:hope).permit(:comment).merge(hope: @hope,group: @group,group_reader: @group_reader)
  end

  def hope_destroy
    
  end

end
