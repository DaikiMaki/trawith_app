require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @room = rooms(:one)
    @message = @user.messages.build(message: "test",
                                   room_id: @room.id)
  end
  
  test "should be valid" do
    assert @message.valid?
  end
  
  test "message should be present" do
    @message.message = " "
    assert_not @message.valid?
  end
  
  test "message should be at most 140 characters" do
    @message.message = "a" * 141
    assert_not @message.valid?
  end


end
