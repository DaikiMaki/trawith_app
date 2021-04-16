require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @prefecture = Prefecture.first
    @split = Split.first
    @micropost = @user.microposts.build(prefecture_id: @prefecture.id,
                                        split_id: @split.id,
                                        content: "テスト")
  end
  
  test "should be valid" do
    assert @micropost.valid?
  end
  
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "prefecture id should be present" do
    @micropost.prefecture_id = nil
    assert_not @micropost.valid?
  end
  
  test "split id should be present" do
    @micropost.split_id = nil
    assert_not @micropost.valid?
  end
  
  
  test "content should be present" do
    @micropost.content = " "
    assert_not @micropost.valid?
  end
  
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
  
end
