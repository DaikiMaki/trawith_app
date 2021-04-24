class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    @user = User.find_by(id: @inquiry.user_id)
    mail(
      to: ENV['SECRET_MAIL'],
      subject: 'お問い合わせ通知'
    )
  end
  
end
