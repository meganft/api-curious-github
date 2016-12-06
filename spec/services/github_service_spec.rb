require 'rails_helper'

describe "GithubService" do
  context "#user_info" do
    it "returns user data" do
      github_user = GithubService.new.user_info

      expect(github_user.class).to eq(Hash)
      # expect(averages).to have_key(:avg_dni)
      # expect(averages).to have_key(:avg_ghi)
      # expect(averages).to have_key(:avg_lat_tilt)
    end
  end
end
