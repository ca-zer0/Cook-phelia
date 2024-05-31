class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :kondate
  has_many :foods, dependent: :destroy
  has_one_attached :image
  has_many :lists
  belongs_to :user

  with_options presence: true do
    validates :image, presence: { message: '写真は必須です' }
    validates :name, presence: { message: '料理名が空白です' }
    validates :category_id, numericality: { other_than: 1, message: "カテゴリーが空白です"} 
    validates :kondate_id, numericality: { other_than: 1, message: "献立が空白です"} 
    validates :people, presence: { message: '何人前かが空白です' }
    validates :user
    end

    validates_associated :foods
end
