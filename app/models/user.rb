class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX, message: "パスワードには半角英字と半角数字の両方を含めて設定してください"}

         validates :name, presence: true

         has_many :lists
         has_many :recipes, through: :lists
end