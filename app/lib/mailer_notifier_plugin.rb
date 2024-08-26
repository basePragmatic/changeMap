class MailerNotifierPlugin
  attr_reader :class_name, :action

  def initialize(class_name:, action:)
    @class_name, @action = class_name, action
  end

  def notify(user, ...)
    return unless user.notifications_enabled? &&
                  user.email_notifications_enabled?

    mailer = class_name.constantize.with(user: user)
    mailer.public_send(action, ...).deliver_later
  end
end
