class GroupsController < ApplicationController
  def edit
    @name = ""
  end

  def new
    @group = Group.new
    @user = User.all
  end


end
