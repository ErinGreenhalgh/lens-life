require "test_helper"

class UsersServiceTest < ActiveSupport::TestCase
  include DateFormatter
  test "it gets recent commits for a repo" do
    VCR.use_cassette("user") do
      date = format_since_date(Time.now, 1)
      byebug
      repo = "lithub"
      commits = UsersService.new.get_recent_commits(repo, date)

      assert_equal 1, commits.count

    end
  end

end
