module UsersHelper
  def posts_for(user)
    user.posts.count
  end

  def comments_for(user)
    user.comments.count
  end
end
