class Admin::UsersController < ApplicationController
  before_action :if_not_admin

  def index
    @users = User.includes(:stores)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      if current_user.admin?
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def profile_params
    params.require(:user).permit(:name, :shift_stabilize, :max_work, :wages, :holiday, :priority, wday: [], store_ids: [])
  end
end
