class SplashScreenController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :except => [:index]

  def index
  end
end
