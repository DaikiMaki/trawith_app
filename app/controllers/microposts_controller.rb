class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :search]
  before_action :correct_user, only: :destroy
  
  def create
    @search = Micropost.ransack(params[:q])
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'error.js.erb'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to request.referrer || root_url
  end
  
  def search
    @micropost = Micropost.new
    @search = Micropost.ransack(params[:q])
    @search_microposts = @search.result.page(params[:page])
  end
  
  
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :prefecture_id,  :split_id, :image)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?    
  end
  
end

