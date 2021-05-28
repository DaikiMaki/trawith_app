require 'test_helper'

class InquiriesNewTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "confirmation of sending inquiries" do
    log_in_as(@user)
    get new_inquiry_path
    assert_template 'inquiries/new'
    assert_select 'textarea[name=?]', 'inquiry[message]'
    post inquiries_path, params: { inquiry: { message: "" } }
    assert_template 'inquiries/new'
    post inquiries_path, params: { inquiry: { message: "test" } }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to new_inquiry_path
  end
  
end
