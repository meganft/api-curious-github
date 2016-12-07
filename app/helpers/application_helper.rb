module ApplicationHelper

  def formatted_date
    newdate = DateTime.parse(current_user.joined_date)
    newdate.strftime('%b %d, %Y')

  end
end
