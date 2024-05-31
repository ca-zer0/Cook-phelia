FactoryBot.define do
  factory :food do

    name {'てすと'}
    amount {5}
    unit {'g'}
    association :recipe
    end
end
