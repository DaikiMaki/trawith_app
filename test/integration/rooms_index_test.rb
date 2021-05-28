require 'test_helper'

class RoomsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @michael = users(:michael)
    @room1 = rooms(:one)
    @room2 = rooms(:two)
  end

  test "Displaying and deleting the talk room list" do
    log_in_as(@michael)
    get rooms_path
    assert_template 'rooms/index'
    assert_select 'a[href=?]', room_path(@room1)
    assert_select 'a[href=?]', room_path(@room2)
    assert_difference 'Room.count', -1 do
      delete room_path(@room1)
    end
  end

end
