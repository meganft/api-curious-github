require 'rails_helper'

describe "Event" do
  context ".by_user(token, username)" do
    it "returns instance of Repo" do
      token = ENV["github_user_token"]
      events = Event.by_user(token, "meganft")

      expect(events).to be_a(Array)
      expect(events.first).to be_an(Event)
      expect(events[0].username).to be_truthy
      expect(events[0].event_type).to be_truthy
      expect(events[0].repo_name).to be_truthy
      expect(events[0].created_at).to be_truthy
    end
  end
end
