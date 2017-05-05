class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('created_at DESC')
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
    messages = Message.all
  end

  def create
    Message.create(message_params)
    redirect_to action: :index
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
