FactoryBot.define do
  factory :user do
    test_user = Gimei.name

    name {"test"}
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end