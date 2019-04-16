class UserMailer < ApplicationMailer
  default from: "noreply@example.com"
  layout "mailer"

  def account_activation user
    @user = user

    mail to: user.email, subject: t("mailer.sub_account_activation")
  end
end
