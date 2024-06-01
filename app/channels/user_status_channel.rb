class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_status_#{current_user.id}"

    current_user.update(online: true)
    ActionCable.server.broadcast "user_status_channel", user_id: current_user.id, status: 'online'
  end

  def unsubscribed
    current_user.update(online: false)
    ActionCable.server.broadcast "user_status_channel", user_id: current_user.id, status: "offline"
  end
end
