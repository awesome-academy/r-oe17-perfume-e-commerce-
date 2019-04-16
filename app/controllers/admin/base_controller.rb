class Admin::BaseController < ActionController::Base
  layout "admin"

  include SessionsHelper

  private
  def logged_in_user
    unless logged_in? && (@current_user.is_admin? || @current_user.is_mod?)
      flash[:alert] = t "controllers.admin.base.flash_alert_login"
      redirect_to root_url
    end
  end
end
