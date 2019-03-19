class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredient_attributes: [
      :id,
      :title,
      :quantity
      ])
  end
end
