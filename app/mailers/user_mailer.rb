class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント認証"
  end

  def password_reset
    @greeting = "下記URLをタップしてアカウントを認証してください。"

    mail to: "to@example.org"
  end
end
