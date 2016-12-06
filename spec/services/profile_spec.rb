require 'rails_helper'

describe "Profile" do
  context ".find_user" do
    it "returns a user's info" do
      user = Profile.find_user("meganft")

      expect(user.class).to eq(Profile)
      expect(user.name).to eq("Megan T")
      expect(user.location).to eq("Denver, CO")
      expect(user.email).to be_truthy
    end
  end
end
