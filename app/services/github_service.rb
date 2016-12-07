class GithubService

  def get_repos(username)
    response = Faraday.get("https://api.github.com/users/#{username}/repos?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def get_user(username)
    response = Faraday.get("https://api.github.com/users/#{username}?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
