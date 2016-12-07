require 'rails_helper'

describe "Organization" do
  context ".by_user(token)" do
    it "returns a list of all organizations for a user" do
      token = ENV["github_user_token"]
      organizations = Organization.by_user(token)

      expect(organizations[0]).to be_a(Organization)
      expect(organizations).to be_a(Array)
      expect(organizations[0]).to respond_to(:name)
      expect(organizations[0]).to respond_to(:url)
      expect(organizations[0]).to respond_to(:image)
    end
  end
end
