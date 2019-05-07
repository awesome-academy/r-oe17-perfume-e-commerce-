FactoryBot.define do
  factory :supplier do
    company_name{Faker::Company.name}
    contact_name{Faker::Name.name}
    homepage{"https://google.com"}
    address{Faker::Address.street_address}
    city{Faker::Address.city}
  end
end
