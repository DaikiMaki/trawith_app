class RoomsController < ApplicationController
  before_action :logged_in_user

  def index
    current_entries = current_user.entries
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    @user = User.find(params[:entry][:user_id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
            redirect_to room_path(@roomId)
          end
        end
      end
    end
    unless @haveRoom
      @room = Room.create
      @joinCurrentUser = Entry.create(user_id: current_user.id, room_id: @room.id)
      @joinUser = Entry.create(join_room_params)
      redirect_to room_path(@room.id)
    end
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes(:user).order(created_at: :desc)
      @messages = @messages.page(params[:page]).per(10)
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy
    flash[:success] = "トークルームが削除されました"
    redirect_to rooms_path
  end

    private

  def join_room_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end

end