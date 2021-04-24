class InquiryMailerPreview < ActionMailer::Preview

  def inquiry
     inquiry = Inquiry.new(user_id: User.second.id, message: "問い合わせメッセージ")

     InquiryMailer.send_mail(inquiry)
  end
  
end
