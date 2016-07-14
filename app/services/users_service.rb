class UsersService

  def initialize
    @_connection = Faraday.new("https://api.github.com")
  end

  def get_starred_repos(user)
    connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = connection.get("/user/starred")
    JSON.parse(response.body)
  end

  def get_events(user)
    response = connection.get("/users/#{user.nickname}/events")
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def connection
    @_connection
  end

end
