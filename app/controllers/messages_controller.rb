class MessagesController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :set_room

  def create
    if Entry.where(user_id: current_user.id, room_id: @room.id)
      @message = Message.create(message_params)
      @message.image.attach(params[:message][:image])
      ActionCable.server.broadcast 'room_channel', message: @message.template
      @room = @message.room
      if @message.save
        @roommembernotme=Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
        @theid=@roommembernotme.find_by(room_id: @room.id)
        notification = current_user.active_notifications.create(
            message_id: @message.id,
            visited_id: @theid.user_id,
            visitor_id: current_user.id,
            action: 'dm'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?

        @message = Message.new
        gets_entries_all_messages
      end
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
    params.require(:message).permit(:user_id, :message, :room_id, :image).merge(user_id: current_user.id)
  end
end
