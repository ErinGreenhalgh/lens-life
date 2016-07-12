class Repo

  def initialize(new_repos_hash)
    @id = new_repos_hash["id"]
    @name = new_repos_hash["name"]
    @full_name = new_repos_hash["full_name"]
    @owner = new_repos_hash["owner"]["login"]
  end

  def self.all

  end
end
