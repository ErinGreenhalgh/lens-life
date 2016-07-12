class Repo
  attr_reader :user, :name

  def initialize(user, new_repos_hash)
    @user = user
    @id = new_repos_hash["id"]
    @name = new_repos_hash["name"]
    @full_name = new_repos_hash["full_name"]
    @owner = new_repos_hash["owner"]["login"]
  end

  def self.all(user)
    r = ReposService.new
    raw_repos = r.get_repos(user)
    raw_repos.map do |repo|
      Repo.new(user,repo)
    end
  end
end
