class Account::SettingsController < ::UsersController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def new
    @password_form = PasswordForm.new(current_user)
  end

  def create
    @password_form = PasswordForm.new(current_user)
    if @password_form.submit(password_params)
      flash[:success] = t(".update_success")
      redirect_to current_user
    else
      render :new
    end
  end

  private
  def password_params
    params.require(:password_form).permit(:original_password,
      :new_password,
      :new_password_confirmation)
  end
end
