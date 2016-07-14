require "test_helper"

class UsersServiceTest < ActiveSupport::TestCase
  def setup
    @user = User.create(uid: "1234",
                       nickname: "ErinGreenhalgh",
                       oauth_token: ENV["test_token"] )
  end

  test "gets starred repos" do
    VCR.use_cassette("user") do
      assert_equal 1, UsersService.new.get_starred_repos(@user).count
    end
  end


  test "it gets a user's event data" do
    VCR.use_cassette("user_no_token") do
      events = UsersService.new.get_events(@user)
      assert_equal "4275555661", events.first[:id]
    end
  end

end
