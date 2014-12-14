class CategoriesController < ApplicationController

  def all
    @categories = Category.all
  end

  def show
    @posts = Post.where(category_id: params[:id])
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to('/categories/all')
    end
  end

  # def edit
  # end

  # def update
  # end

  # Saving this for Admins.
  # def destroy
  #   @category = Category.find(params[:id])
  #   @category.destroy
  #   redirect_to root_path
  # end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end
