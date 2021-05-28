require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:archer)
  end
  
  test "should redirect edit for wrong accout_activation" do
    get edit_account_activation_path(@user)
    assert_redirected_to root_url
  end

end
