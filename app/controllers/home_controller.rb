class HomeController < ApplicationController
  def index
    if session[:user_id] != nil
      @events = Event.received_by_user(current_user.token, current_user.username)
    end
  end
end
