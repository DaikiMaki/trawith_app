class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page]).order(created_at: :desc).where.not(admin: 1)
    @search = User.ransack(params[:q])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールが送信されました。アカウントを認証してください。"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アカウント編集が完了しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to users_path
  end
  
  def search
    @search = User.ransack(params[:q])
    @search_users = @search.result.page(params[:page])
  end
  
  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                    :password_confirmation,
                                    :introduction)
    end
  
    def correct_user
      @user = User.find(params[:id])
      if @user.admin?
        redirect_to(root_url) unless current_user?(@user)
      end
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end



  