require 'rails_helper'

describe "Event" do
  context ".received_by_user(token, username)" do
    it "returns events received by user" do
      VCR.use_cassette(".received_by_user") do
        token = ENV["github_user_token"]
        received_events = Event.received_by_user(token, "meganft")

        expect(received_events).to be_a(Array)
        expect(received_events.first).to be_an(Event)
        expect(received_events[0].username).to be_truthy
        expect(received_events[0].event_type).to be_truthy
        expect(received_events[0].repo_name).to be_truthy
        expect(received_events[0].created_at).to be_truthy
      end
    end
  end

  context ".performed_by_user(token, username)" do
    it "returns events performed by user" do
      VCR.use_cassette(".performed_by_user") do
        token = ENV["github_user_token"]
        performed_events = Event.performed_by_user(token, "meganft")

        expect(performed_events).to be_a(Array)
        expect(performed_events.first).to be_an(Event)
        expect(performed_events[0].username).to be_truthy
        expect(performed_events[0].event_type).to be_truthy
        expect(performed_events[0].repo_name).to be_truthy
        expect(performed_events[0].created_at).to be_truthy
      end
    end
  end
end
