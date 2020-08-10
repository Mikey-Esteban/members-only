class CommentsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]

  def index
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(comment_params)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.member = current_member
    @comment.save

    if @comment.save
      @post.comments << @comment
      flash[:success] = "comment created!"
      redirect_to root_path
    else
      @posts = @group.posts.paginate(page: params[:page])
      @users = @group.users
      render 'groups/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    flash.alert = "comment deleted"

    redirect_to post_path(@comment.post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
