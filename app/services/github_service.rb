class GithubService

  # def user_info(code)
  #   @response =
  #   Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}&code=#{params["code"]}")
  #   token = @response.body.split(/\W+/)[1]
  #   oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
  #   auth = JSON.parse(oauth_response.body)
  # end

  def get_repos(username)

    response = Faraday.get("https://api.github.com/users/#{username}/repos").body
    parsed_response = JSON.parse(response, symbolize_names: true)

  end
end


#   def annual_averages(address)
#     uri = URI("#{@base_url}?api_key=#{ENV['nrel_api_key']}&address=#{address}")
#     response = Net::HTTP.get(uri)
#     parsed_response = JSON.parse(response, symbolize_names: true)
#     parsed_response[:outputs]
#   end
# end
