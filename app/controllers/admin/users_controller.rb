class Admin::UsersController < ApplicationController
  before_action :authenticate_admin
  before_action :load_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @activities = @user.activities.paginate page: params[:page], per_page: Settings.perpage
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "activate.accountactivate"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profupdated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "admin.user.user_deleted"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit :admin
  end

  def load_user
    @user = User.find params[:id]
  end
end
