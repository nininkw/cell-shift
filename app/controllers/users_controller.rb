class UsersController < ApplicationController
  before_action :ensure_normal_user, only: %i[update destroy]
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
    if @user.email == 'guest@example.com' || @user.email == 'guest_admin@example.com'
      reset_session
      redirect_to :root
    else
      @user.update(is_valid: false)
      reset_session
      redirect_to new_user_session_path
    end
  end

  def confirm_shift_posts
    @user = User.find(params[:id])
    @shift_posts_by_date = @user.shift_posts.group_by { |sp| sp.selected_dates }
  end

  def ensure_normal_user
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com' || @user.email == 'guest_admin@example.com'
      if current_user.admin?
        redirect_to admin_root_path, alert: 'ゲストユーザーの更新・削除はできません。' and return
      else
        redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。' and return
      end
    end
  end


  private

  def profile_params
    params.require(:user).permit(:name, :shift_stabilize, :max_work, :wages, :holiday, :priority, wday: [], store_ids: [])
  end
end
