module ApplicationHelper

  def descend_sort(hash)
     hash = hash.sort_by {|k,v| v}.reverse
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

  def most_active_member(members)
    members_scores = {}
    members.each do |member|
      members_scores[member.name] = member.favoritor_total[:favorite]
    end
    @posts.each do |post|
      post.comments.each do |comment|
        to_add = comment.member.name
        members_scores[to_add] += 1
      end
    end
    return descend_sort(members_scores).take(3)
  end

  def most_active_post(posts)
    posts_scores = {}
    @posts.each do |post|
      posts_scores[post.id] = [post.favoritable_total[:favorite] + post.comments.count, post.message]
    end

    return descend_sort(posts_scores).take(3)
  end

end
