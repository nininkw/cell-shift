class Admin::StoresController < ApplicationController
  FORM_COUNT = 3

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
    FORM_COUNT.times { @store.shift_frames.build }
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_stores_path
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to admin_stores_path
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to admin_stores_path
  end

  private

  def store_params
    params.
      require(:store).
      permit(
        :name, :open_at, :close_at, :need_workers,
      shift_frames_attributes: [:id, :shift_name, :start_at, :finish_at]
      )
  end
end
