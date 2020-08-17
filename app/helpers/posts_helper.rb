module PostsHelper
  POSTS_PER_PAGE = 4

  def find_post_page(postArray)
    post = postArray[0]
    @page = 0
    @posts = Post.all.order("created_at DESC").offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)

    loop do
      if @posts.include?(post)
        break
      else
        @page += 1
        @posts = Post.all.order("created_at DESC").offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
      end
    end
    return @page
  end

end
