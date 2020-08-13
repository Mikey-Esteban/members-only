class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.order("created_at DESC")
  end
end
