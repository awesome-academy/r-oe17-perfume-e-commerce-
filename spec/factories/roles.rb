FactoryBot.define do
  factory :role do
    role_name{"User"}
    users{[FactoryBot.create(:user)]}
  end
end
