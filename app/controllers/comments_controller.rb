class CommentsController < ApplicationController
  def index
    @comments = Comment.order('updated_at DESC')
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
<<<<<<< HEAD
      redirect_to post_path(@post)
=======
      redirect_to post_comments_path
>>>>>>> 61ec922e33e2c63959f3b1d2716752862e6e5d2f
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end

    private
    def comment_params
      params.require(:comment).permit(:content, :creator_id, :post_id)
    end

end
