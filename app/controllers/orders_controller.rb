class OrdersController < ApplicationController
  before_action :set_order

  def edit
    @order = current_order
  end

  def update
    if logged_in?
      @order.customer_id = @current_user.id
    end
    if @order.update_attributes(order_params)
      flash[:success] = t ".update_success"
      session[:order_id] = nil
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def set_order
    @order = current_order
  end

  def order_params
    params.require(:order).permit(
      :ship_name,
      :ship_city,
      :ship_address,
      :required_date
    )
  end
end
