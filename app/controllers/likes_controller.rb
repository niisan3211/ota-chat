class LikesController < ApplicationController
  def create
    like = current_user.likes.build(tweet_id: params[:tweet_id])
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
end
