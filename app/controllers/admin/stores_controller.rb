class Admin::StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    binding.pry
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

  private
    def store_params
      params.require(:store).permit(:name, :address, :open_at, :close_at, :near_stations, :shift_pattern, :shift_in, :shift_out)
    end
end
