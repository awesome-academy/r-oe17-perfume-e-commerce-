class Admin::HomeController < ::Admin::BaseController
  before_action :logged_in_user
  def index; end
end
