class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.is_active? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t "controllers.system.account_activation.activated"
      redirect_to root_url
    else
      flash[:danger] = t "controllers.system.account_activation.not_activated"
      redirect_to root_url
    end
  end
end
