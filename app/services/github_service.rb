class GithubService

  # def user_info(code)
  #   @response =
  #   Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}&code=#{params["code"]}")
  #   token = @response.body.split(/\W+/)[1]
  #   oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
  #   auth = JSON.parse(oauth_response.body)
  # end

  def get_repos(username)
    response = Faraday.get("https://api.github.com/users/#{username}/repos?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def get_user(username)
    response = Faraday.get("https://api.github.com/users/#{username}?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)

  end
end
