class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @group = current_user.groups.last
    @groups = current_user.groups.order('created_at DESC')
    @message = Message.new
    redirect_to group_messages_path(@group) if @group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループ作成に成功しました'
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

end
