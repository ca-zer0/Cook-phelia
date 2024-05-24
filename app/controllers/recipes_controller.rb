class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show, :search]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @recipes = Recipe.where(user_id: current_user.id).order("created_at DESC")
    else
      @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def new
    @recipe_food = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
  
    if recipe.save
      params[:foods].each do |food_params|
        recipe.foods.create(food_params.permit(:name, :amount, :unit))
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
    valid_foods = foods_params.select { |food| food.values.all?(&:present?) }
  
    ActiveRecord::Base.transaction do
      @recipe_food.update!(recipe_params)
      @recipe_food.foods.each_with_index do |food, i|
        next if valid_foods[i].nil?
        food.update!(valid_foods[i])
      end
  
      # 新たな食材を追加
      if valid_foods.size > @recipe_food.foods.size
        @recipe_food.foods.build(valid_foods[@recipe_food.foods.size..-1])
        @recipe_food.save!
      end
    end
  
    redirect_to recipe_path
  rescue => e
    Rails.logger.error e
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @recipe_food.destroy
    redirect_to root_path
  end

  def search
    @recipes = Recipe.all
    if params[:category].present? && params[:category] != '1'
      @recipes = @recipes.where(category_id: params[:category])
    end
    if params[:kondate].present? && params[:kondate] != '1'
      @recipes = @recipes.where(kondate_id: params[:kondate])
    end
    render 'search'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :category_id, :kondate_id, :people, foods: [:name, :amount, :unit])
  end
  
  def foods_params
    params.require(:foods).map do |food|
      food.permit(:name, :amount, :unit, :recipe_id)
    end
  end

  def set_recipe
    @recipe_food = Recipe.find(params[:id])
  end

end
