require "test_helper"

class UsersServiceTest < ActiveSupport::TestCase
  test "it creates event objects through open struct" do
    event = Event.new(user)all.first
    assert event.payload
    assert event.type
  end
end
