require 'rails_helper'

describe "Repo" do
  context ".by_user(username)" do
    it "returns instance of Repo" do
      repos = Repo.by_user("meganft")

      expect(repos[0]).to be_a(Repo)
      expect(repos).to be_a(Array)
      expect(repos[0].id).to be_truthy
      expect(repos[0].language).to be_truthy
      expect(repos[0].url).to be_truthy
      expect(repos[0].id).to be_truthy
    end
  end
end
