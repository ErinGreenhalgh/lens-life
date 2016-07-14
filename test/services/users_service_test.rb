require "test_helper"

class UsersServiceTest < ActiveSupport::TestCase
  test "it gets recent commits for a repo" do
    VCR.use_cassette("user") do
      user = User.create()
      events = UsersService.new.get_events(user)

      assert_equal 1, commits.count

    end
  end

end
