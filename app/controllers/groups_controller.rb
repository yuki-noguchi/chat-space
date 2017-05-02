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
    binding.pry
    redirect_to controller: :messages, action: :index
  end

  private
  def group_params
    params.require(:group).permit(:name, :user_ids)
  end
end
