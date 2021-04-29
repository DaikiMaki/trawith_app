class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail(
      from: "trawith@example.com",
      to: user.email, subject: "アカウント認証"
    )
  end

  def password_reset(user)
    @user = user
    mail(
      from: "trawith@example.com",
      to: user.email, subject: "パスワード再設定"
    )
  end
end
