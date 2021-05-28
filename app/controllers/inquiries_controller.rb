class InquiriesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(user_id: current_user.id, message: params[:inquiry][:message])
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      flash[:success] = "お問い合わせ内容が送信されました"
      redirect_to new_inquiry_path
    else 
      render 'inquiries/new'
    end
  end
  
end
