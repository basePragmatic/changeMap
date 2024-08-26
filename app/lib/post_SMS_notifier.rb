class PostSMSNotifier < ApplicationSMSNotifier
  def published(post)notification(to: user.phone_number,
    body: "Post has been published: #{post.title}")
  end
end
