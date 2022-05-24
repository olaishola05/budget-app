class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = Category.includes(:transact).all
  end

  def show
    @user = current_user
    @category = Category.find(params[:id])
    # @transacts = @category.transacts
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
