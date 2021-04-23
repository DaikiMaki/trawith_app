class MessagesController < ApplicationController
  before_action :set_room

  def create
    if Entry.where(user_id: current_user.id, room_id: @room.id)
      @message = Message.create(message_params)
      if @message.save
        @message = Message.new
        gets_entries_all_messages
      end
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
  end
  
  private

  def set_room
    @room = Room.find(params[:message][:room_id])
  end

  def gets_entries_all_messages
    @messages = @room.messages.includes(:user).order("created_at asc")
    @entries = @room.entries
  end

  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end
end
