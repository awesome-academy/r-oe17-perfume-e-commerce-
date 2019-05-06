FactoryBot.define do
  factory :user do
    email{"ironman@avengers.com"}
    first_name{"Tony"}
    last_name{"Stark"}
    password{"abcd1234"}
    password_confirmation{"abcd1234"}
  end
end
