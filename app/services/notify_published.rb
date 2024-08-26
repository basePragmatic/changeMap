class Post::NotifyPublished < ApplicationService
  plug :mailer, class_name: "PostMailer", action: "published"
  plug :sms, content: ->(post) { "Post has been published: #{post.title}" }
  plug :cable, event: "post.published", payload: ->(post) { post.slice(:id, :title) }

  param :post

  def call
    post.user.subscribers.each { notify(_1, post) }
  end

  def call
    payload = post.slice(:id, :title)
      .merge(event: "post.published")

    post.user.subscribers.each do |user|
      NotificationsChannel.broadcast_to(user, payload)
      next unless user.notifications_enabled?

      if user.email_notifications_enabled?
        PostMailer.with(user: user)
          .published(post)
          .deliver_later
      end

      if user.sms_notifications_enabled?
        SMSSender.new(user.phone_number).send_later(
          body: "Post has been published: #{post.title}"
        )
      end
    end
  end
end
