require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user = users(:michael)
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Trawith App"
  end
  
  test "should get login" do
    get login_path
    assert_response :success
    assert_select "title", "Log in | Trawith App"
  end

  test "should get contact" do
    log_in_as(@user)
    get new_inquiry_path
    assert_response :success
    assert_select "title", "Contact | Trawith App"
  end


end
