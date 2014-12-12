class PostsController < ApplicationController

  def index
    @post  = Post.all
    @posts = @post.order("updated_at")
  end

  def new
    if current_user
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    # binding.pry

      params[:post]


      @post = Post.new(post_params)
      # @post.creator = params[:session][:username] NOT FUNCTIONAL, PROBABLY CREATOR DOESNT WORRK
      @post.creator_id = current_user.id
      # params[:post][:category] = @category.id
      @post.save
      redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit( :content, :creator, :title)
    end


end

