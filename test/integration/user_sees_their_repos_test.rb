require 'test_helper'

class UserSeesTheirReposTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = LitHub::Application
  end

  test "they see a list of all their repos" do
    
  end
end
