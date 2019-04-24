class Account::DetailsController < ::UsersController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @user.update_attributes(update_user_params)
      flash[:success] = t ".update_success"
      redirect_to user_account_details_url(@user)
    else
      render :show
    end
  end

  private
  def update_user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username
    )
  end
end
