require 'rails_helper'

describe "GithubService" do
  context "#get_repos(username)" do
    it "returns users repos" do

      user_repos = GithubService.new.get_repos("meganft")

      expect(user_repos.class).to eq(Array)
      expect(user_repos.first).to have_key(:id)
      expect(user_repos.first).to have_key(:language)
      expect(user_repos.first[:owner][:login]).to eq("meganft")
    end
  end

  context "#get_user(username)" do
    it "returns one users info" do

      user = GithubService.new.get_user("meganft")

      expect(user.class).to eq(Hash)
      expect(user[:login]).to eq("meganft")
    end
  end
end
