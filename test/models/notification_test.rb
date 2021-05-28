require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  
  def setup 
    @message = messages(:one)
    @visitor = users(:michael)
    @visited = users(:archer)
    @notificationdm = @visitor.active_notifications.create(visitor_id: @visitor.id,
                                                               visited_id: @visited.id,
                                                               action: "dm")

    @notificationfollow = @visitor.active_notifications.create(visitor_id: @visitor.id,
                                                               visited_id: @visited.id,
                                                               action: "follow")
  end
  
  test "should be valid" do
    assert @notificationdm.valid?
    assert @notificationfollow.valid?
  end
  
end
