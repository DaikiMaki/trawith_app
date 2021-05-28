require 'test_helper'

class InquiryTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @inquiry = Inquiry.create(user_id: @user.id, 
                              message: "test")
  end
  
  test "should be valid" do
    assert @inquiry.valid?
  end
  
  test "message should be present" do
    @inquiry.message = " "
    assert_not @inquiry.valid?
  end
  
  test "message should be at most 1000 characters" do
    @inquiry.message = "a" * 1001
    assert_not @inquiry.valid?
  end


end
