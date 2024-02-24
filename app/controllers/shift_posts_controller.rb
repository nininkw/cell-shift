class ShiftPostsController < ApplicationController  

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

    saved = true
    valid_dates.each do |valid_date|
      @shift_post = ShiftPost.new(shift_post_params)
      @shift_post.selected_dates = valid_date
      unless @shift_post.save
        saved = false
        break
      end
    end
    
    if saved
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shift_post = ShiftPost.find(params[:id])
  end

  def update
    @shift_post = ShiftPost.find(params[:id])
    if @shift_post.saved
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @shift_post = ShiftPost.find(params[:id])
    @shift_post.destroy
  end
  

  private

  def shift_post_params
    params.require(:shift_post).permit(selected_dates:[])
          .merge(user_id: current_user.id)
  end
end
