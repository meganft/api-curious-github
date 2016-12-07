class Repo

  attr_reader :id, :name, :language, :url, :updated, :fork

  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:url]
    @updated = attributes[:updated_at]
    @fork = attributes[:fork]

  end

  def self.by_user(token)
    service = GithubService.new(token)
    service.get_repos.map do |repo_info|
      Repo.new(repo_info)
    end
  end

  def self.six_popular(token)
    service = GithubService.new(token)
    mapped = service.get_repos.map do |repo_info|
      Repo.new(repo_info)
    end.first(6)
  end

  # def self.starred(username)
  #   service = GithubService.new
  # end


end
