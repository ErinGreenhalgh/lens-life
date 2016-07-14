require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "it gets recent commits for a repo" do
    VCR.use_cassette("event") do
      user = User.create(uid: "1234",
                         nickname: "ErinGreenhalgh",
                         oauth_token: ENV["test_token"] )
      commit = Event.commits(user).first
      sha = "e511f4e5b61eac416c5ad97935ef0930e3ae24fa"

      assert_equal sha, commit.sha
    end
  end

end
