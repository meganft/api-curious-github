module ApplicationHelper

  def following_count
    Profile.find_following(current_user.token).count
  end

  def followers_count
    Profile.find_followers(current_user.token).count
  end

  def starred_count
    Repo.find_starred(current_user.token).count
  end

  def organizations
    Organization.by_user(current_user.token)
  end
end
