class UsersService

  def initialize
    @_connection = Faraday.new("https://api.github.com")
    @_connection.headers["Authorization"] = "token #{user.oauth_token}"

  end

  def get_starred_repos(user)
    response = connection.get("/user/starred")
    JSON.parse(response.body)
  end

  def get_recent_commits(repo, date)
    response = connection.get()
  end

private
  def connection
    @_connection
  end

end
