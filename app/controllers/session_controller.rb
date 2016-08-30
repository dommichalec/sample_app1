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
      flash.now[:danger] = "Ah snap! Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
  end
end
