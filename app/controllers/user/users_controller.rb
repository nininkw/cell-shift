class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to user_root_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :shift_stabilize, :max_work, wday: [], store_ids: []).merge(id: current_user.id)
  end
end
