class ReposService

  def get_repos(user)
    connection = Faraday.new("https://api.github.com")
    connection.headers["Authorization"] = "token #{user.oauth_token}"

    response = connection.get("/user/repos")

    JSON.parse(response.body)
  end
end
