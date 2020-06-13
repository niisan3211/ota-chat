class MessagesController < ApplicationController
  def new
    @tweet = Tweet.new
    @user_id = current_user.id
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to action: :new
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text,:image).merge(user_id: current_user.id,genru_id: params[:genru_id])
  end

end
