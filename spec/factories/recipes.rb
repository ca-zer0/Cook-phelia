FactoryBot.define do
  factory :recipe do

    name {'テスト'}
    category_id {3}
    kondate_id {2}
    people {'3人前'}
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
