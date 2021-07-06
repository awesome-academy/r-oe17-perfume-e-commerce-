class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t "controllers.client.user.remind_activation"
      redirect_to user_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
    return unless @user.nil?

    flash[:danger] = t "controllers.client.user.flash_user_doesnt_exist"
    redirect_to root_url
  end
end
