50.times do |n|
name  = "Example Category#{n+1}"
description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
 Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
 when an unknown printer took a galley of type and scrambled it to make a type specimen book."
Category.create!(category_name:  name,
  description: description
)
end

Role.create(
  role_name: "Administrator",
  description: "Administrator"
)
Role.create(
  role_name: "Moderator",
  description: "Moderator"
)
Role.create(
  role_name: "User",
  description: "User"
)

User.create!(username: "superuser",
  email: "example@perfum.org",
  first_name: "Super",
  last_name: "User",
  password: "abcd1234",
  password_confirmation: "abcd1234",
  is_admin: true,
  is_active: true,
  activated_at: Time.zone.now,
  role_ids: 1
)

99.times do |n|
  username = Faker::Games::Dota.hero
  first_name = "Example"
  last_name = "User#{n + 1}"
  email = "example-#{n + 1}@perfum.org"
  password = "abcd1234"
  User.create!(username:  username,
               last_name: last_name,
               first_name: first_name,
               email: email,
               password: password,
               password_confirmation: password,
               is_active: true,
               activated_at: Time.zone.now,
               role_ids: 3)
end
