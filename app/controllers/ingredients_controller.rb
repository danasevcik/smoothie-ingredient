class IngredientsController < ApplicationController

  def index
    @smoothies = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params(:name, :smoothie_id))
    # byebug

    @ingredient.smoothie_id = Smoothie.find_by(name: params["smoothie"]).id
    @ingredient.save
    # @smoothie = Smoothie.find_by(name: params["smoothie"])
    redirect_to smoothies_path
  end

  def new
    @ingredient = Ingredient.new
    @smoothies = Smoothie.all
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params(:name))
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def ingredient_params(*args)
    params.require(:ingredient).permit(*args)
  end
end
