class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order('created_at DESC')
    @last_group = current_user.groups.last
    @users = current_user.groups.last.users
    @message = Message.new
    @group = Group.find(params[:group_id])
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
