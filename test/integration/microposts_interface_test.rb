require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @prefecture = Prefecture.first
    @split = Split.first
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "",
                                                   prefecture_id: "",
                                                   split_id: "" } }
    end
    assert_select 'div#error_explanation'
    assert_select 'a[href=?]', '/?page=2'  
    content = "テスト"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content,
                                                   prefecture_id: @prefecture.id,
                                                   split_id: @split.id } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    assert_select 'a', text: '削除'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    get user_path(users(:archer))
    assert_select 'a', text: '削除', count: 0
  end
end
