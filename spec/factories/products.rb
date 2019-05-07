FactoryBot.define do
  factory :product do
    product_name{Faker::Superhero.name}
    quantity_per_init{1}
    unit_price{49.99}
    unit_in_stock{10.0}
    unit_in_order{2.0}
    discontinue{false}
    reorderlevel{1}
    concentration{Faker::Number.number(3)}
    product_style{Faker::Vehicle.style}
    weight{"300"}
    description{"This is description"}
    picture_url{Faker::LoremPixel.image("400x600")}
    category{FactoryBot.create(:category)}
    brand{FactoryBot.create(:brand)}
    supplier{FactoryBot.create(:supplier)}
    sense{FactoryBot.create(:sense)}
  end
end
