require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "gets count of starred repos" do
    VCR.use_cassette("user") do
      user = User.create(uid: "1234",
                         nickname: "ErinGreenhalgh",
                         oauth_token: ENV["test_token"] )
      assert_equal 1, user.starred_count(user)      
    end
  end
end
