class PostsController < ApplicationController

  def index
    @posts = Post.order("updated_at")
  end

  def new
    if current_user
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
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

  # Voting

  def upvote
    @post = Post.find(params[:id])
    @post.votes.create(value: 1, voter: current_user)
    redirect_to(:back)
  end

  def downvote
    @post = Post.find(params[:id])
    @post.votes.create(value: -1, voter: current_user)
    redirect_to(:back)
  end

  private
    def post_params
      params.require(:post).permit(:id, :content, :user_id, :title, :category_id)
    end
end
