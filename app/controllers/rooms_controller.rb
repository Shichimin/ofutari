class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.create
    @room_user1 = RoomUser.create(room_id: @room.id, user_id: current_user.id)
    @room_user2 = RoomUser.create(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])

    if RoomUser.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @room_users = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to room_path
  end

  def chat_message
    @message = Message.new(content: params[:content], room_id: params[:room_id], user_id: current_user.id)
    if @message.save
      ActionCable.server.broadcast 'room_channel', content: @message
    end
  end

  private

  def room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
