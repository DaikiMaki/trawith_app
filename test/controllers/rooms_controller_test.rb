require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @room = rooms(:one)
    @another_room = rooms(:two)
    @entry = Entry.create(user_id: @user.id, room_id: @room.id)
  end

  test "should redirect index when not logged in" do
    get rooms_path
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Room.count' do
      post rooms_path
    end
    assert_redirected_to login_url
  end

  test "should redirect show when not logged in" do
    get room_path(@room)
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(@user)
    assert_no_difference 'Room.count' do
      delete micropost_path(@another_room)
    end
    assert_redirected_to root_url
  end


end
