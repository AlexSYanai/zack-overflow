class CategoriesController < ApplicationController
  include CategoryHelper
<<<<<<< HEAD
  before_filter :is_admin?, except: [:new, :create, :index, :show, :edit, :update, :destroy]
=======
  before_filter :is_admin?, except: [:index, :show]

  def index
    @categories = Category.all
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
<<<<<<< HEAD

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  def show
    @category = Category.find(params[:id])
=======

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
>>>>>>> 32f469079622d2a4d88b2c01586806425cc07cf0
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
