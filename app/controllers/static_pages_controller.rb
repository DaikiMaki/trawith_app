class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @search = Micropost.ransack(params[:q])
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_following_items = Micropost.where(user_id: current_user.following_ids).paginate(page: params[:page])
    end
  end

  def about
  end
  
end
