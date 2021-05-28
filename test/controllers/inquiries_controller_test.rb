require 'test_helper'

class InquiriesControllerTest < ActionDispatch::IntegrationTest
  
  test "should redirect create when not logged in" do
    get new_inquiry_path
    assert_redirected_to login_url
  end
  
  test "should redirect create for wrong inquiry" do
    assert_no_difference 'Message.count' do
      post inquiries_path, params: { message: { content: "test" } }
    end
    assert_redirected_to login_url
  end

end
