class ApplicationController < ActionController::Base
  
  def hello
    render html:"ようこそ！trawithへ！"
  end
  
end
