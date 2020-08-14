class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, except: [:index, :show]

  def toggle_favorite
    @post = Post.find_by(id: params[:id])
    current_member.favorited?(@post) ? current_member.unfavorite(@post) : current_member.favorite(@post)
  end

  def toggle_follow
    @post = Post.find(params[:id])
    @member = @post.member
    # current_member.favorite(@post.member)
    current_member.favorited?(@member) ? current_member.unfavorite(@member) : current_member.favorite(@member)
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new

    @members = Member.all
    # @comment = current_member.comments.build if member_signed_in?
    # @comment.post_id = @post.id
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = current_member.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_member.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:message, :title, :image)
    end
end
