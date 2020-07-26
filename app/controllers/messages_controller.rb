class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      if @message.save
        respond_to do |format|
          format.any
          format.json {render genru_group_path(genru_id: @message.group.genru_id,id: @message.group.id)}
        end
        redirect_to  genru_group_path(genru_id: params[:genru_id],id: params[:group_id])
      end
    else
      redirect_to genru_group_path(genru_id: params[:genru_id],id: params[:group_id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:message,:message_image).merge(user_id: current_user.id,group_id: params[:group_id])
  end
end
