class RecipeFood < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :name, :category_id, :kondate_id,:people, :foodname, :amount, :unit, :foods

  with_options presence: true do
    validates :name
    validates :category_id
    validates :kondate_id
    validates :people
  end

  has_one_attached :image
  belongs_to :recipe
  belongs_to :food
end