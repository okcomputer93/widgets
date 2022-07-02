FactoryBot.define do
  factory :widget_status do
    # Unique Lorem Ipsum word
    name { Faker::Lorem.unique.word }
  end
end