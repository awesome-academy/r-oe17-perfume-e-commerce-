class OrderDetailsController < ApplicationController
  before_action :set_order

  def create
    @order_detail = @order.order_details.new(order_detail_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_detail = @order.order_details.find_by(id: params[:id])
    return redirect_to root_url if @order_detail.nil?

    @order_detail.update_attributes(order_detail_params)
    @order_details = @order.order_details
  end

  def destroy
    @order_detail = @order.order_details.find(params[:id])
    if @order_detail.destroy
      @order_details = @order.order_details
    else
      flash[:error] = t ".delete_alert"
      redirect_to root_url
    end
  end

  private
  def set_order
    @order = current_order
  end

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end
end
