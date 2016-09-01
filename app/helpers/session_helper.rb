module SessionHelper

  def login(user)
    session[:user_id] = user.id
  end

  def authenticate(user)
    user && user.authenticate(params[:session][:password])
  end
end
