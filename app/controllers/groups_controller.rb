class GroupsController < ApplicationController
  def edit
    @name = ""
  end

  def new
    @group = Group.new
    @user = User.all
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
