module ApplicationHelper

  def descend_sort(hash)
     hash = hash.sort_by {|k,v| v}.reverse
  end

  def member_liked_data(current_member)
    list = current_member.all_favorited
    data = { :liked_posts => [], :following => [] }

    list.each do |fave|
      data[:liked_posts] << fave if fave.class == Post
      data[:following] << fave if fave.class == Member
    end

    return data
  end

  def member_followers(current_member)
    current_member.favoritors_by_type('Member')
  end


  def time_ago_in_words(x, y)
    diff = x - y
    if diff < 60
      return diff.round.to_s + 's'
    elsif diff < 3600
      diff = (diff / 60).round
      return diff.to_s + 'm'
    elsif diff < 86400
      diff = (diff / 60 / 60).round
      return diff.to_s + 'h'
    elsif diff < 6048000
      diff = (diff / 60 / 60 / 24).round
      return diff.to_s + 'd'
    else
      diff = (diff / 60 / 60 / 24 / 7).round
      return diff.to_s + 'wk'
    end
  end

  def top_member
    data = {}
    @members.each do |member|
      # score = member.all_favorites.count
      score = 0
      temp = member_liked_data(member)
      score += temp[:following].length
      score += temp[:liked_posts].length
      score += current_member.favoritors_by_type('Member').length
      score += member.comments.count
      score += member.posts.count
      data[member] = score
    end

    return descend_sort(data).take(3)
  end

  # def most_active_member(members)
  #   members_scores = {}
  #   members.each do |member|
  #     members_scores[member.name] = [member, member.favoritor_total[:favorite]]
  #   end
  #   # @posts.each do |post|
  #   #   post.comments.each do |comment|
  #   #     to_add = comment.member.name
  #   #     members_scores[to_add][1] += 1
  #   #   end
  #   # end
  #   @comments.each do |comment|
  #     members_scores[comment.member.name][1] += 1
  #   end
  #
  #   return descend_sort(members_scores).take(3)
  # end

  def top_posts
    data = {}
    @all_posts.each do |post|
      data[post] = post.favoritors.count + post.comments.count
    end

    return descend_sort(data).take(3)
  end

end
