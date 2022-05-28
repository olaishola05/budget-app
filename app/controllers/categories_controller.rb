class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
    @categories = Category.includes(:transact).where(user_id: @user.id)
  end

  def show
    @user = current_user
    @category = Category.find(params[:id])
    @transacts = Transact.includes(:category).where(category_id: @category.id)
    @transacts = @transacts.where(user_id: @user.id) if @user
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user_id = @user.id
    if @category.save
      redirect_to categories_path, notice: 'Successfully created category'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
