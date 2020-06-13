class GenrusController < ApplicationController
  def index
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
    @genru.save
    redirect_to  action: "new"
  end

  private

  def genru_params
    params.require(:genru).permit(:name)
  end
end
