require 'test_helper'

class RoomsshowTest < ActionDispatch::IntegrationTest

  def setup
    @michael = users(:michael)
    @archer = users(:archer)
    @room1 = rooms(:one)
  end

  test "トークルームの表示" do
    log_in_as(@michael)
    get room_path(@room1)
    assert_template 'rooms/show'
    assert_select 'a[href=?]', user_path(@archer)
    assert_select 'p', text: "message test two"
  end

end
