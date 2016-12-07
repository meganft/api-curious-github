require 'rails_helper'

describe "Profile" do
  context ".find_user" do
    it "returns a user's info" do
      token = ENV["github_user_token"]
      user = Profile.find_user(token)

      expect(user.class).to eq(Profile)
      expect(user.name).to eq("Megan T")
      expect(user.location).to eq("Denver, CO")
    end
  end
end
