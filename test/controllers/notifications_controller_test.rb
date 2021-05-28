require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect index when not logged in" do
    get notifications_path
    assert_redirected_to login_url
  end

end
