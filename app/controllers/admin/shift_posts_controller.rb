class Admin::ShiftPostsController < ApplicationController
  before_action :if_not_admin

  def index
    @shift_posts = ShiftPost.includes(:user)
  end

  def new
    @shift_post = ShiftPost.new
  end

  def create
    selected_dates = params[:shift_post][:selected_dates]
    valid_dates = selected_dates.select do |ymd|
      begin
        Date.parse(ymd)
        true
      rescue ArgumentError
        false
      end
    end
    @shift_post = ShiftPost.new(shift_post_params)
    @shift_post.selected_dates = valid_dates 
    if @shift_post.save
      redirect_to user_root_path
    else
      render :new
    end
  end

  def show
    @shift_post = ShiftPost.find(params[:id])
  end

  def edit
    @shift_post = ShiftPost.find(params[:id])
  end

  def update
    @shift_post = ShiftPost.find(params[:id])
    @shift_post.user_id = params[:data][:user_id]
    @shift_post.selected_dates = params[:data][:selectedDates]
    if @shift_post.update
      redirect_to user_root_path
    else
      render :edit
    end   
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def shift_post_params
    params.require(:shift_post).permit(selected_dates: [])
          .merge(user_id: current_user.id)
  end
end
