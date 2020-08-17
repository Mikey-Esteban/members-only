class CommentsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]

  def index
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @page = find_post_page(@post)
    @comment = @post.comments.build(comment_params)
    @comment.member = current_member
    @comment.save

    if @comment.save
      @post.comments << @comment
      flash[:success] = "comment created!"
      redirect_to "/posts?page=#{@page}"
    else
      @posts = @group.posts.paginate(page: params[:page])
      @users = @group.users
      render 'groups/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @page = params[:page]
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    flash.alert = "comment deleted"

    redirect_to "/posts?page=#{@page}"
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
