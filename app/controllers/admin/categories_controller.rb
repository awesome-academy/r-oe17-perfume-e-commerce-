class Admin::CategoriesController < Admin::BaseController
  before_action :logged_in_user

  def index
    @categories = Category.ordered_by_name
                          .page(params[:page])
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:info] = t "controllers.admin.category.create_success"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :description)
  end
end
