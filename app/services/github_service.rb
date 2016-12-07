class GithubService

  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_repos
    response = conn.get("/user/repos?sort=updated")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    response = conn.get("/user")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_followers
    response = conn.get("/user/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_following
    response = conn.get("/user/following")
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_unauthenticated_user(username)
    response = conn.get("/users/#{username}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :token, :conn
end
