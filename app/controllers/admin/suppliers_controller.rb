class Admin::SuppliersController < Admin::BaseController
  def index
    @suppliers = Supplier.ordered_by_name
                         .page(params[:page])
  end

  def create
    @supplier = Supplier.new supplier_params
    if @supplier.save
      flash[:info] = t "controllers.admin.supplier.create_success"
      redirect_to admin_suppliers_url
    else
      render :new
    end
  end

  def new
    @supplier = Supplier.new
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
end
