class Food < ApplicationRecord
  belongs_to :recipe

  VALID_AMOUNT_REGEX = /\A[0-9]+\z/

  with_options presence: true do
  validates :name
  validates :amount, format: { with: VALID_AMOUNT_REGEX, message: "半角数字で入力してください" }
  validates :unit
  end
end

