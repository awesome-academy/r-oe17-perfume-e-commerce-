class Account::EmailController < ::UsersController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      @user.change_email
      @user.send_activation_email
      flash[:success] = t ".update_success"
      redirect_to user_account_email_url(@user)
    else
      render :edit
    end
  end
end
