class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :kondate
  has_many :foods, dependent: :destroy
  has_one_attached :image
  has_many :lists
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :kondate_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :people
    validates :user
    end
end
