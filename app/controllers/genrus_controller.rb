class GenrusController < ApplicationController
  def show
    @tweets = Tweet.where(genru_id: params[:id]).order(:id)
    @genru = Genru.find_by(id: params[:id])
    @groups = Group.where(genru_id: @genru.id)
    @search = @groups.ransack(params[:q])
    @groups_search = @search.result(distinct: true)
  end

  def new
    @genru = Genru.new
    @genrus = Genru.all.order("name")
    # あいうえお順、アルファベット順になる
    @genru_search = @genrus.where(['name LIKE ?', "%#{params[:search]}%"]) if params[:search].present?
    # redirect_to action: "new"
  end

  def create
    @genru = Genru.new(genru_params)
    @genru.users << current_user
    # ↑はアソシエーション組んだからできる
    @genru.save
    redirect_to  action: "new"
  end

  private

  def genru_params
    params.require(:genru).permit(:name)
  end
  
end
