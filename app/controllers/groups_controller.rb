class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups.order('created_at DESC')
    @last_group = current_user.groups.last
    @users = current_user.groups.last.users
    @message = Message.new
    @group = Group.last
    messages = Message.all
    @messages = @group.messages
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループ作成に成功しました'
    else
      flash.now[:error] = 'グループの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループ編集に成功しました'
    else
      flash.now[:error] = 'グループの編集に失敗しました'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
