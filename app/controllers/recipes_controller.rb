class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def new
    @recipe_food = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
  
    if recipe.save
      params[:foods].each do |food_params|
        recipe.foods.create(food_params.permit(:name, :amount))
      end
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new, alert: recipe.errors.full_messages
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :category_id, :kondate_id, :people, foods: [:name, :amount])
    end
  
  def foods_params
    params.require(:foods).map do |food|
      food.permit(:name, :amount, :recipe_id)
    end
  end
  
end
