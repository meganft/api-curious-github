require 'rails_helper'

describe "Profile" do
  context ".find_user" do
    it "returns a user's info" do
      VCR.use_cassette(".find_user") do
        token = ENV["github_user_token"]
        user = Profile.find_user(token)

        expect(user.class).to eq(Profile)
        expect(user.name).to eq("Megan T")
        expect(user.location).to eq("Denver, CO")
      end
    end
  end

  context "#find_followers" do
    it "returns a user's followers" do
      VCR.use_cassette(".find_followers") do
        token = ENV["github_user_token"]
        followers = Profile.find_followers(token)

        expect(followers.class).to eq(Array)
        expect(followers[0]).to respond_to(:joined_date)
        expect(followers.first.name).to eq("Anna Dolan")
      end
    end
  end

  context "#find_following" do
    it "returns all follwing a user" do
      VCR.use_cassette(".find_following") do
        token = ENV["github_user_token"]
        following = Profile.find_following(token)

        expect(following.class).to eq(Array)
        expect(following[0]).to respond_to(:joined_date)
        expect(following.first.name).to eq("Erin Pintozzi")
      end
    end
  end
end
