class UsersService

  def get_starred_repos(user)
    connection = Faraday.new("https://api.github.com")
    connection.headers["Authorization"] = "token #{user.oauth_token}"

    response = connection.get("/user/starred")
    JSON.parse(response.body)
  end

end
