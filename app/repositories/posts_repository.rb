class PostsRepository
  def search(tag: nil)
    Post.where("EXISTS (" \
      "SELECT 1 FROM json_each(tags) WHERE value = ?)",
      tag
    )
  end
end
