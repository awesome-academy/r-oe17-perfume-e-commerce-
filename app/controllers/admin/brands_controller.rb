class Admin::BrandsController < Admin::BaseController
  before_action :set_brand, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.ordered_by_name
                   .page(params[:page])
  end

  def create
    @brand = Brand.new brand_params
    if @brand.save
      flash[:info] = t "controllers.admin.brand.create_success"
      redirect_to admin_brands_url
    else
      render :new
    end
  end

  def new
    @brand = Brand.new
  end

  def edit; end

  def update
    if @brand.update_attributes(brand_params)
      flash[:success] = t "controllers.admin.brand.update_success"
      redirect_to admin_brands_url
    else
      render :edit
    end
  end

  private
  def brand_params
    params.require(:brand).permit(
      :brand_name,
      :description,
      :country_name,
      :homepage
    )
  end

  def set_brand
    @brand = Brand.find_by(id: params[:id])
    if @brand.nil?
      flash[:danger] = t "controllers.admin.brand.set_brand_invalid"
      redirect_to admin_root_url
    end
  end
end
