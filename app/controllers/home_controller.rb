class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @categories = Category.all
    @products = Product.order(sort_column + " " + sort_direction)
                       .page(params[:page])
  end

  def contact; end

  def about; end

  private
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : t(".product_name")
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ?  params[:direction] : t(".asc")
  end
end
