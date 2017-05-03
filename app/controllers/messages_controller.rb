class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order('created_at DESC')
    @group = current_user.groups.last
    @users = current_user.groups.last.users
  end
end
