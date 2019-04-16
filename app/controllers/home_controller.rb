class HomeController < ApplicationController
  def index
    @categories = Category.all
  end

  def contact; end

  def about; end
end
