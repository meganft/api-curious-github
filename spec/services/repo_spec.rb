require 'rails_helper'
#add test for 6 popular

describe "Repo" do
  context ".by_user(token)" do
    it "returns instance of Repo" do
      token = ENV["github_user_token"]
      repos = Repo.by_user(token)

      expect(repos[0]).to be_a(Repo)
      expect(repos).to be_a(Array)
      expect(repos[0]).to respond_to(:id)
      expect(repos[0]).to respond_to(:language)
      expect(repos[0]).to respond_to(:url)
    end
  end

  context ".find_starred(token)" do
    it "returns starred repos for a user" do
      token = ENV["github_user_token"]
      starred = Repo.find_starred(token)

      expect(starred).to be_a(Array)
      expect(starred[0]).to respond_to(:id)
      expect(starred[0]).to respond_to(:url)
    end
  end
end
