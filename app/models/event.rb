class Event
  
  attr_reader :username, :created_at, :event_type, :repo_name

  def initialize(attributes = {})
    @username = attributes[:actor][:login]
    @created_at = attributes[:created_at]
    @event_type = attributes[:type]
    @repo_name = attributes[:repo][:name]
  end

  def self.received_by_user(token, username)
    service = GithubService.new(token)
    service.get_received_events(username).map do |event_info|
      Event.new(event_info)
    end
  end

  def self.performed_by_user(token, username)
    service = GithubService.new(token)
    service.get_performed_events(username).map do |event_info|
      Event.new(event_info)
    end
  end
end
