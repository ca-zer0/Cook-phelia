class List < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :foods
end