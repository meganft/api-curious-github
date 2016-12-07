class DashboardController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.username)
    @popular_repos = Repo.six_popular(current_user.username)

  end
end
