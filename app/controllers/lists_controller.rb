class ListsController < ApplicationController

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to recipes_path
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
def list_params
  params.require(:list).permit(:recipe_id, :user_id)
end
end