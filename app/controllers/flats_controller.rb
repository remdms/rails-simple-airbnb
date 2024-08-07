class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    set_flat
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_flat
  end

  def update
    set_flat
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night, :picture_url)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
