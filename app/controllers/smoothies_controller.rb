class SmoothiesController < ApplicationController

  def index
    @smoothies = Smoothie.all
  end

  def show
    @smoothie = Smoothie.find(params[:id])
    @ingredients = @smoothie.ingredients
  end

  def create
    @smoothie = Smoothie.create(smoothie_params(:name))
    redirect_to smoothies_path
  end

  def new
    @smoothie = Smoothie.new
  end

  def edit
    @smoothie = Smoothie.find(params[:id])
  end

  def update
    @smoothie = Smoothie.find(params[:id])
    @smoothie.update(smoothie_params(:name))
    redirect_to smoothie_path(@smoothie)
  end

  def destroy
    @smoothie = Smoothie.find(params[:id])
    @smoothie.destroy
    redirect_to smoothies_path
  end

  def smoothie_params(*args)
    params.require(:smoothie).permit(*args)
  end

end
