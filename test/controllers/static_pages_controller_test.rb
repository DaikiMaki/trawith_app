require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Trawith App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Trawith App"
  end
  
  test "should get contact" do
    get new_inquiry_path
    assert_response :success
    assert_select "title", "Contact | Trawith App"
  end


end
