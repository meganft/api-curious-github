class StarredController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.token)

    @starred = Repo.find_starred(current_user.token)
  end
end
