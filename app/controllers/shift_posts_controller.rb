class ShiftPostsController < ApplicationController
include AjaxHelper

  def new
    @shift_post = ShiftPost.new
  end

  def create
    saved = true
    ShiftPost.new(shift_post_params).selected_dates.each do |date|
      @shift_post = ShiftPost.new(shift_post_params)
      @shift_post.selected_dates = Date.parse(date)
      saved = saved && @shift_post.save
    end
    if saved
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render ajax_redirect_to(root_path) }
      end 
    else
      respond_to do |format|
        format.html { render :new }
      end
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

  def shift_post_params
    params.require(:shift_post).permit(selected_dates:[])
          .merge(user_id: current_user.id)
  end
end
