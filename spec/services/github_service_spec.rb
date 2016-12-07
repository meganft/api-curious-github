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
end
