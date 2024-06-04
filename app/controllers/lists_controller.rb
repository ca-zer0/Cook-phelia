class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy]
  
  def index
    @lists = current_user.lists.includes(:recipe)
    @recipes = Recipe.where(id: @lists.pluck(:recipe_id))
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'Successfully added to the list.'
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.present?
      @list.destroy
      redirect_to lists_path, notice: 'Successfully removed from the list.'
    else
      redirect_to lists_path, alert: 'The item does not exist in the list.'
    end
  end

  def check
    present = current_user.lists.exists?(recipe_id: params[:recipe_id])
    render json: { is_added: present }
  end

  private

  def set_list
    @list = current_user.lists.find_by(recipe_id: params[:recipe_id])
  end

  def list_params
    params.require(:list).permit(:recipe_id)
  end
end