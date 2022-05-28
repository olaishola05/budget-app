class UsersController < ApplicationControllers
  def index
    @users = current_user
  end
