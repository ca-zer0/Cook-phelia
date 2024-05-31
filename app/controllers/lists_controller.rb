class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists.includes(:recipe).all
    @recipe_ids = current_user.lists.pluck(:recipe_id)
    @recipes = Recipe.where(id: @recipe_ids)
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to recipes_path, notice: 'Successfully added to the list.'
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list = current_user.lists.find_by(recipe_id: params[:recipe_id])
    if @list.present?
      @list.destroy
      flash[:notice] = "Successfully removed from the list."
    else
      flash[:alert] = "The item does not exist in the list."
    end
    redirect_to lists_path
  end

  def check
    present = List.exists?(recipe_id: params[:recipe_id])
    render json: { is_added: present }
  end

  private
  def list_params
    params.require(:list).permit(:recipe_id, :user_id)
  end
end
