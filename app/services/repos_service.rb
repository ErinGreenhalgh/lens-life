class ReposService

  def get_repos(user, repo_hash)
    connection = Faraday.new("https://api.github.com")
    connection.headers["Authorization"] = "token #{user.oauth_token}"

    response = connection.get("/users/repos")
    JSON.parse(response.body)
  end
end
