
class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    @category.save
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
