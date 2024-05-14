class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    ActiveRecord::Base.transaction do
      @recipe_food.update!(recipe_params)
      @recipe_food.foods.each_with_index do |food, i|
        food.update!(foods_params[i])
      end
    end
    redirect_to recipe_path
  rescue ActiveRecord::RecordInvalid
    Rails.logger.debug @recipe_food.errors.full_messages
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @recipe_food.destroy
    redirect_to root_path
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

  def set_recipe
    @recipe_food = Recipe.find(params[:id])
  end

end
