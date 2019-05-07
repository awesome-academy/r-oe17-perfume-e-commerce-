FactoryBot.define do
  factory :brand do
    brand_name{Faker::Company.name}
    description{Faker::Company.buzzword}
    country_name{Faker::Address.country}
    homepage{"https://google.com"}
  end
end
