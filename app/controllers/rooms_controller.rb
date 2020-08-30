class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.create
    @room_user1 = RoomUser.create(room_id: @room.id, user_id: current_user.id)
    @room_user2 = RoomUser.create(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
