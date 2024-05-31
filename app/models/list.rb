class List < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :foods

  with_options presence: true do
    validates :user
    validates :recipe
  end
end