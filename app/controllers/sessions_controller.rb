class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      if user.is_active?
        log_in user
        remember_checked user
      else
        message  = t "controllers.client.session.mess_not_activated"
        message += t "controllers.client.session.mess_not_activated2"
        flash[:warning] = message
      end
      redirect_to root_url
    else
      flash.now[:danger] = t "controllers.client.session.flash_invalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def remember_checked user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end
end
