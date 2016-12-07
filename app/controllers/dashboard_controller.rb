class DashboardController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.token)
    @popular_repos = Repo.six_popular(current_user.token)

  end
end
