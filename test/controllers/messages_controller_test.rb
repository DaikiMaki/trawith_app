require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  test "should redirect create when not logged in" do
    assert_no_difference 'Message.count' do
      post messages_path, params: { message: { content: "test" } }
    end
    assert_redirected_to login_url
  end

end
