class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
    @tweet.images.new
    @user_id = current_user.id
  end
  def create
    @tweet = Tweet.new(tweet_params)
    unless @tweet.valid?
      redirect_to action: :new and return
    end
    @tweet.save
    redirect_to controller: :genrus, action: :show,id:(params[:genru_id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text,images_attributes: [:src]).merge(user_id: current_user.id,genru_id: params[:genru_id])
    # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る
  end

end
