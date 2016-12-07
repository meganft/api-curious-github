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
    mapped = service.get_repos(username).map do |repo_info|
      Repo.new(repo_info)
    end
    mapped.sort! { |a,b| b.updated <=> a.updated }
  end

  def self.six_popular(username)
    service = GithubService.new
    mapped = service.get_repos(username).map do |repo_info|
      Repo.new(repo_info)
    end.first(6)
  end

  # def self.starred(username)
  #   service = GithubService.new
  # end


end
