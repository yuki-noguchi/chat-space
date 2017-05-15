class UsersController < ApplicationController
  def search
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'groups/new', json: @users }
    end
  end
end
