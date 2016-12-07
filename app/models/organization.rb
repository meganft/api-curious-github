class Organization

  attr_reader :name, :image, :url

  def initialize(attributes={})
    @name = attributes[:login]
    @image = attributes[:avatar_url]
    @url = attributes[:url]
  end

  def self.by_user(token)
    service = GithubService.new(token)
    service.get_organizations.map do |organization_info|
      Organization.new(organization_info)
    end
  end

end
