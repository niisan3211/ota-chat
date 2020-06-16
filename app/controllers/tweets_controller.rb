class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
    @user_id = current_user.id
  end
  def create
    @tweet = Tweet.new(tweet_params)
    unless @tweet.valid?
      render action: :new and return
    end
    @tweet.save
    redirect_to controller: :genrus, action: :show,id:(params[:genru_id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text,:image).merge(user_id: current_user.id,genru_id: params[:genru_id])
  end

end
