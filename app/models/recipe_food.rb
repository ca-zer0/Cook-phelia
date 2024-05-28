class RecipeFood < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :name, :category_id, :kondate_id,:people, :foodname, :amount, :unit, :foods

  belongs_to :recipe
  belongs_to :food
end