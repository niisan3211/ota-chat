class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to  genru_group_path(genru_id: params[:genru_id],id: params[:group_id])
    else
      redirect_to genru_group_path(genru_id: params[:genru_id],id: params[:group_id])
    end
  end

  private

  def message_params
    params.permit(:message,:message_image).merge(user_id: current_user.id,group_id: params[:group_id])
  end
end
