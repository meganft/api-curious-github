class Repo

  attr_reader :id, :name, :language, :url, :updated

  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:url]
    @updated = attributes[:updated_at]
  end

  def self.by_user(username)
    service = GithubService.new
    service.get_repos(username).map do |repo_info|
      Repo.new(repo_info)
    end
  end

end
