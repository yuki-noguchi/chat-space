class GroupsController < ApplicationController
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

  def show
    @groups = Group.order('created_at DESC')
    @group = Group.find(params[:id])
    @users = Group.find(params[:id]).users
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to action: :show
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
