module MembersHelper

  def divide_posts(posts_object)
    result = []
    each_array = []

    posts_object.each do |post|
      each_array << post
      if each_array.length == 3
        result << each_array
        each_array = []
      end
    end

    result << each_array
    return result
  end

end
