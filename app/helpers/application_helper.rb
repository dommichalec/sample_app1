module ApplicationHelper
  def full_title(title = '')
    base_title = "Ruby on Rails Tutorial"
    if title.blank?
      base_title
    else
      title + " | " + base_title
    end
  end

  def show_development_debugger
    debug(params) if Rails.env.development?
  end
end
