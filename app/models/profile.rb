class Profile

  attr_reader :username, :name, :email, :profile_picture, :location, :joined_date

  def initialize(attributes={})
    @username = attributes[:username]
    @name = attributes[:name]
    @email = attributes[:email]
    @profile_picture = attributes[:avatar_url]
    @location = attributes[:location]
    @joined_date = attributes[:created_at]
  end

  def self.find_user(token)
    user = GithubService.new(token).get_user
    Profile.new(user)
  end

  def self.find_followers(token)
    service = GithubService.new(token)
    followers = service.get_followers
    followers.map do |follower|
      follower_info = service.find_unauthenticated_user(follower[:login])
      Profile.new(follower_info)
    end
  end

  def self.find_following(token)
    service = GithubService.new(token)
    following = service.get_following
    following.map do |following|
      following_info = service.find_unauthenticated_user(following[:login])
      Profile.new(following_info)
    end
  end


end
