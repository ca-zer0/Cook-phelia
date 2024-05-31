FactoryBot.define do
  factory :list do
    association :recipe
    association :user
  end
end
