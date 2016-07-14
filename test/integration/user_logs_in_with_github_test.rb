require 'test_helper'

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def  setup
    Capybara.app = LitHub::Application
    stub_omniauth
  end

  test "logging in" do
    VCR.use_cassette("user") do
      visit '/'
      assert_equal 200, page.status_code
      click_link "Log In with Github"
      assert_equal '/', current_path
      assert page.has_content?("Welcome, Cool Guy")
      assert page.has_content?("Log Out")
      end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "1234",
      info: {
        nickname: "Cool Guy",
      },
      credentials: {
        token: "pizza"
      },
      extra: {
        raw_info: {
          followers: 1,
          following: 1
        }
      }
      })
  end

end
