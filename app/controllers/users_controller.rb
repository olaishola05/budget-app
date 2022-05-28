class UsersController < ApplicationControllers
  def index
    @user = current_user
  end