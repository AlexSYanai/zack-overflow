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
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
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

  #Voting

  def upvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: 1, voter: current_user)
    redirect_to(:back)
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: -1, voter: current_user)
    redirect_to(:back)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :creator_id, :post_id)
    end

end
