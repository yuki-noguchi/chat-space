class MessagesController < ApplicationController
  def index
    @groups = Group.order('created_at DESC')
    @group = Group.last
    @users = Group.last.users
  end
end
