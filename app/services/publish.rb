class Post
  class Publish < ApplicationService
    param :post

    def call
      post.update!(
        published_at: Time.current,
        status: :published
      )
      NotifyPublished.call(post)
    end
  end
end
