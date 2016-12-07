require 'rails_helper'
#add test for 6 popular

describe "Repo" do
  context ".by_user(token)" do
    it "returns instance of Repo" do
      token = ENV["github_user_token"]
      repos = Repo.by_user(token)

      expect(repos[0]).to be_a(Repo)
      expect(repos).to be_a(Array)
      expect(repos[0].id).to be_truthy
      expect(repos[0].language).to be_truthy
      expect(repos[0].url).to be_truthy
      expect(repos[0].id).to be_truthy
    end
  end

  context ".find_starred(token)" do
    it "returns starred repos for a user" do
      token = ENV["github_user_token"]
      starred = Repo.find_starred(token)

      expect(starred).to be_a(Array)
      expect(starred[0].id).to be_truthy
      expect(starred[0].url).to be_truthy
      expect(starred[0].id).to be_truthy
    end
  end
end
