class FollowersController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.token)
    @followers = Profile.find_followers(current_user.token)
  end
end
