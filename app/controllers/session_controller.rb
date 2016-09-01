class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if authenticate(user)
      login(user)
      redirect_to user_url(user)
      flash[:success] = "You're all logged in and ready to go!"
    else
      flash.now[:danger] = "Ah snap! Invalid email/password combination." # need flash.now because render doesn't count as a request, but redirect_to does
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil # or session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
    flash[:success] = "You're all logged out. Come back again shortly!"
  end
end
