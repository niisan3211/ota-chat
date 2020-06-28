class LikesController < ApplicationController
  before_action :set_item
  
  def create
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    @tweet = Tweet.find_by(id: like.tweet_id)
    if like.save
      redirect_to genru_path(id: params[:genru_id]) and return
    else
      render genru_path(id: params[:genru_id]) and return
    end
    
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id],user_id: current_user.id)
    if like.destroy
      redirect_to genru_path(id: params[:genru_id]) and return
    else
      render genru_path(id: params[:genru_id]) and return
    end
  end

  private
  def set_item
    @genru = Genru.find_by(params[:id])
    @tweets = Tweet.where(genru_id: params[:id]).order(:id) 
  end

end
