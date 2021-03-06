require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns users repos" do
      VCR.use_cassette("#get_repos") do
        token = ENV["github_user_token"]
        user_repos = GithubService.new(token).get_repos

        expect(user_repos.class).to eq(Array)
        expect(user_repos.first).to have_key(:id)
        expect(user_repos.first).to have_key(:language)
      end
    end
  end

  context "#get_user" do
    it "returns one users info" do
      VCR.use_cassette("#get_user") do
        token = ENV["github_user_token"]
        user = GithubService.new(token).get_user

        expect(user.class).to eq(Hash)
        expect(user[:login]).to eq("meganft")
      end
    end
  end

  context "#get_followers" do
    it "returns one users followers" do
      VCR.use_cassette("#get_followers") do
        token = ENV["github_user_token"]
        followers = GithubService.new(token).get_followers

        expect(followers.class).to eq(Array)
        expect(followers.first).to have_key(:login)
        expect(followers.first[:login]).to eq("annadolan")
      end
    end
  end

  context "#get_following" do
    it "returns all followed by one user" do
      VCR.use_cassette("#get_followeing") do
        token = ENV["github_user_token"]
        following = GithubService.new(token).get_following

        expect(following.class).to eq(Array)
        expect(following.first).to have_key(:login)
        expect(following.first[:login]).to eq("epintozzi")
      end
    end
  end

  context "#get_starred" do
    it "returns all starred repos from one user" do
      VCR.use_cassette("#get_starred") do
        token = ENV["github_user_token"]
        starred_repos = GithubService.new(token).get_starred

        expect(starred_repos.class).to eq(Array)
        expect(starred_repos.first).to have_key(:full_name)
    end
    end
  end

  context "#get_received_events" do
    it "returns all recent events received for one user" do
      VCR.use_cassette("#get_received_events") do
        token = ENV["github_user_token"]
        received_events = GithubService.new(token).get_received_events("meganft")

        expect(received_events.class).to eq(Array)
        expect(received_events.first).to have_key(:actor)
      end
    end
  end

  context "#get_performed_events" do
    it "returns all recent events performed for one user" do
      VCR.use_cassette("#get_performed_events") do
        token = ENV["github_user_token"]
        performed_events = GithubService.new(token).get_performed_events("meganft")

        expect(performed_events.class).to eq(Array)
        expect(performed_events.first).to have_key(:actor)
      end
    end
  end

  context "#get_organizations" do
    it "returns all organizations for one user" do
      VCR.use_cassette("#get_organizations") do
        token = ENV["github_user_token"]
        organizations = GithubService.new(token).get_organizations

        expect(organizations.class).to eq(Array)
        expect(organizations.first).to have_key(:login)
      end
    end
  end
end
