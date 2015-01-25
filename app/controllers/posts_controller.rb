class PostsController < ApplicationController

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.order("created_at DESC")
    end
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
    @post.votes.create(value: 1, user_id: current_user)
    render plain: "#{@post.total_points}  points"
  end

  def downvote
    @post = Post.find(params[:id])
    @post.votes.create(value: -1, voter: current_user)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private
    def post_params
      params.require(:post).permit(:id, :content, :user_id, :title, :category_id)
    end
end
