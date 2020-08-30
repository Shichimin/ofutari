class UsersController < ApplicationController
  before_action :move_to_login

  def show
    @user = User.find_by(id: params[:id])

    @room_user_by_current_user = RoomUser.where(user_id: current_user.id)
    @room_user_by_user = RoomUser.where(user_id: @user.id)

    @room_user_by_current_user.each do |cu|
      @room_user_by_user.each do |u|
        if cu.room_id == u.room_id then
          @is_room = true
          @room_id = cu.room_id
        end
      end
    end
    unless @is_room
      @room = Room.new
      @room_user = RoomUser.new
    end
  end

  private

  def move_to_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
