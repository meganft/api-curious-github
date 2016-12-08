class DashboardController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.token)
    @popular_repos = Repo.six_popular(current_user.token)
    @events = Event.received_by_user(current_user.token, current_user.username)
    @user_events = Event.performed_by_user(current_user.token, current_user.username)
  end
end
