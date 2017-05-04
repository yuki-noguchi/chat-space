class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('created_at DESC')
    @users = @group.users
    @message = Message.new
    messages = Message.all
    @messages = @group.messages
  end

  def create
    Message.create(message_params)
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
