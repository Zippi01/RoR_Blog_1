module PostsHelper
  def full_name(post)
    "#{Author.find(post.author_id).first_name} #{Author.find(post.author_id).last_name}"
  end
end
