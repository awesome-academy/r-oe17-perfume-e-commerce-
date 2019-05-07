FactoryBot.define do
  factory :sense do
    sense_name{Faker::Dessert.flavor}
  end
end
