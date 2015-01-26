class CategoriesController < ApplicationController
  before_filter :is_admin?, except: [:new, :create, :index, :show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
