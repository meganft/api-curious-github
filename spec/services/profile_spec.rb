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

  context "#get_followers" do
    it "returns a user's followers" do
      token = ENV["github_user_token"]
      followers = Profile.find_followers(token)

      expect(followers.class).to eq(Array)
      expect(followers[0].joined_date).to be_truthy
      expect(followers.first.name).to eq("Anna Dolan")
    end
  end

  context "#get_following" do
    it "returns all follwing a user" do
      token = ENV["github_user_token"]
      following = Profile.find_following(token)

      expect(following.class).to eq(Array)
      expect(following[0].joined_date).to be_truthy
      expect(following.first.name).to eq("Erin Pintozzi")
    end
  end
end
