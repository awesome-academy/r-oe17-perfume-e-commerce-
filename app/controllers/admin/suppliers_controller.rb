class Admin::SuppliersController < Admin::BaseController
  before_action :set_supplier, only: [:edit, :update, :destroy]

  def index
    @suppliers = Supplier.ordered_by_name
                         .page(params[:page])
  end

  def create
    @supplier = Supplier.new supplier_params
    if @supplier.save
      flash[:info] = t "controllers.admin.supplier.create_success"
      redirect_to admin_supplier_url
    else
      render :new
    end
  end

  def new
    @supplier = Supplier.new
  end

  def edit; end

  def update
    if @supplier.update_attributes(supplier_params)
      flash[:success] = t "controllers.admin.supplier.create_success"
      redirect_to admin_suppliers_url
    else
      render :edit
    end
  end

  private
  def supplier_params
    params.require(:supplier).permit(
      :company_name,
      :contact_name,
      :homepage,
      :address,
      :city
    )
  end

  def set_supplier
    @supplier = Supplier.find_by(id: params[:id])
    if @supplier.nil?
      flash[:danger] = t "controllers.admin.supplier.set_supplier_invalid"
      redirect_to admin_root_url
    end
  end
end
