class CommentsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:tweet_id])
    @comments = Comment.where(tweet_id: @tweet.id)
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    unless @comment.valid?
      render action: :show and return
    end
    @comment.save
    respond_to do |format|
      format.html {redirect_to action: :show,id:(params[:id]) and return}
      format.json
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,tweet_id: params[:tweet_id])
  end


end
