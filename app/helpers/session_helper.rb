module SessionHelper

  def login(user)
    session[:user_id] = user.id
  end

  def authenticate(user)
    user && user.authenticate(params[:session][:password])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # same as @current_user = @current_user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
