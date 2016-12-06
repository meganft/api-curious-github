class Profile

  attr_reader :name, :email, :profile_picture, :location, :joined_date

  def initialize(attributes)
    @name = attributes[:name]
    @email = attributes[:email]
    @profile_picture = attributes[:avatar_url]
    @location = attributes[:location]
    @joined_date = attributes[:created_at]
  end

  def self.find_user(username)
    service = GithubService.new
    attributes = service.get_user(username)
    Profile.new(attributes)
  end

end
