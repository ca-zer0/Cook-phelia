class Food < ApplicationRecord
  belongs_to :recipe
  validates :name, :amount, :unit, presence: true
end

