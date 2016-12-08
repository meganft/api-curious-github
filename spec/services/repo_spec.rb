require 'rails_helper'


describe "Repo" do
  context ".by_user(token)" do
    it "returns instance of Repo" do
      VCR.use_cassette(".repo_by_user") do
        token = ENV["github_user_token"]
        repos = Repo.by_user(token)

        expect(repos[0]).to be_a(Repo)
        expect(repos).to be_a(Array)
        expect(repos[0]).to respond_to(:id)
        expect(repos[0]).to respond_to(:language)
        expect(repos[0]).to respond_to(:url)
      end
    end
  end

  context ".find_starred(token)" do
    it "returns starred repos for a user" do
      VCR.use_cassette(".find_starred") do
        token = ENV["github_user_token"]
        starred = Repo.find_starred(token)

        expect(starred).to be_a(Array)
        expect(starred[0]).to respond_to(:id)
        expect(starred[0]).to respond_to(:url)
      end
    end
  end

  context ".six_popular" do
    it "returns six top repos for a user" do
      VCR.use_cassette(".six_popular") do
        token = ENV["github_user_token"]
        six_popular = Repo.six_popular(token)

        expect(six_popular).to be_a(Array)
        expect(six_popular[0]).to respond_to(:id)
        expect(six_popular[0]).to respond_to(:url)
      end
    end
  end
end
