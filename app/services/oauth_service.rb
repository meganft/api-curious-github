# class OauthService
#
#   def self.register(code)
#     @response =
#     Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
#     token = @response.body.split(/\W+/)[1]
#     oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
#     auth = JSON.parse(oauth_response.body).merge({token: token})
#
#   end
# end
