require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns users repos" do

      user_repos = GithubService.new.get_repos("meganft")

      expect(user_repos.class).to eq(Array)
      expect(user_repos.first).to have_key(:id)
      expect(user_repos.first).to have_key(:name)
      expect(user_repos.first).to have_key(:language)
    end
  end
end
