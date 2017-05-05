class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]
  def index
    @groups = current_user.groups.order('created_at DESC')
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージの送信に成功しました'
    else
      redirect_to group_messages_path(@group), alert: 'メッセージの送信に失敗しました'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
