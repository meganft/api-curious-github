require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns users repos" do
      token = ENV["github_user_token"]
      user_repos = GithubService.new(token).get_repos

      expect(user_repos.class).to eq(Array)
      expect(user_repos.first).to have_key(:id)
      expect(user_repos.first).to have_key(:language)
    end
  end

  context "#get_user" do
    it "returns one users info" do
      token = ENV["github_user_token"]
      user = GithubService.new(token).get_user

      expect(user.class).to eq(Hash)
      expect(user[:login]).to eq("meganft")
    end
  end

  context "#get_followers" do
    it "returns one users followers" do
      token = ENV["github_user_token"]
      followers = GithubService.new(token).get_followers

      expect(followers.class).to eq(Array)
      expect(followers.first).to have_key(:login)
      expect(followers.first[:login]).to eq("annadolan")
    end
  end

  context "#get_following" do
    it "returns all followed by one user" do
      token = ENV["github_user_token"]
      following = GithubService.new(token).get_following

      expect(following.class).to eq(Array)
      expect(following.first).to have_key(:login)
      expect(following.first[:login]).to eq("epintozzi")
    end
  end

  context "#get_starred" do
    it "returns all starred repos from one user" do
      token = ENV["github_user_token"]
      starred_repos = GithubService.new(token).get_starred

      expect(starred_repos.class).to eq(Array)
      expect(starred_repos.first).to have_key(:full_name)
    end
  end

  context "#get_events" do
    it "returns all recent events for one user" do
      token = ENV["github_user_token"]
      events = GithubService.new(token).get_events("meganft")

      expect(events.class).to eq(Array)
      expect(events.first).to have_key(:actor)
    end
  end
end
