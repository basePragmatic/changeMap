class UserWithBookmarkedPostsQuery < ApplicationQuery
  def resolve(period: :previous_week)
    bookmarked_posts = build_bookmarked_posts_scope(period)
    relation.with(bookmarked_posts:)
      .joins(:bookmarked_posts)
  end

  private

  def build_bookmarked_posts_scope(period)
    return Post.none unless Post.respond_to?(period)
    Post.public_send(period)
      .where.associated(:bookmarks)
      .select(:user_id).distinct
  end
end

# query = UserWithBookmarkedPostsQuery.new(User.all)
# @users = query.resolve

# # Пример использования с фильтрацией
# query = UserWithBookmarkedPostsQuery.new(User.where(name: "Yegor"))
# @users = query.resolve(period: :previous_month)