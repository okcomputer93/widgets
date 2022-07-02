FactoryBot.define do
  factory :manufacturer do
    name { Faker::Company.name }
    # Reference to another factory
    address
  end
end