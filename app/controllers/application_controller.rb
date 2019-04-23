class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include HomeHelper
  before_action :load_categories
  helper_method :current_order

  private
  def load_categories
    @categories = Category.all
  end

  def current_order
    if session[:order_id].present?
      current_order = Order.find_by(id: session[:order_id])
      redirect_to root_url if current_order.nil?
      current_order
    else
      Order.new
    end
  end
end
