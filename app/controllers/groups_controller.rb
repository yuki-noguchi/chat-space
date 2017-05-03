class GroupsController < ApplicationController
  def edit
    @name = ""
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

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
