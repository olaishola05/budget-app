class UsersController < ApplicationControllers
  before_action :authenticate_user!

  def index
    @users = current_user
  end
