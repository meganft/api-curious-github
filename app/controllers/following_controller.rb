class FollowingController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.token)
    @following = Profile.find_following(current_user.token)
  end
end
