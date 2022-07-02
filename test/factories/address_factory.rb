FactoryBot.define do
  # Create an instance of Address
  factory :address do
    street { Faker::Address.street_address }
    zip { Faker::Address.zip }
  end
end
