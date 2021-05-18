class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    @user = User.find_by(id: @inquiry.user_id)
    mail(
      to: ENV['GMAIL_USERNAME'],
      subject: 'お問い合わせ通知'
    )
  end
  
end
