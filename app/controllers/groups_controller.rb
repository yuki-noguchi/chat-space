class GroupsController < ApplicationController
  def edit
    @name = ""
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to root_path
    else
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
