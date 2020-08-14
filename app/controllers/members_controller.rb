class MembersController < ApplicationController

  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.order("created_at DESC")
  end
end
