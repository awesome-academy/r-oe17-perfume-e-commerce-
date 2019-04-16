class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def show
    @categories = Category.all
  end

  private
  def set_product
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:danger] = t ".set_product_invalid"
      redirect_to root_url
    end
  end
end
