class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(online: params[:online])
    ActionCable.server.broadcast "user_status_channel", user_id: @user.id, status: @user.online ? "online" : "offline"
  end
end