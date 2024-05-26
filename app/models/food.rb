class Food < ApplicationRecord
  belongs_to :recipe

    validates :name, presence: { message: '食材名が空白です' }
    validate :amount_validation
    validates :unit, presence: { message: '食材の単位が空白です' }

  private

  def amount_validation
    if amount.blank?
      errors.add(:amount, '食材の量が空白です')
    elsif amount !~ /\A[0-9]+\z/
      errors.add(:amount, "食材の量は半角数字で入力してください")
    end
  end
end