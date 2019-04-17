FactoryBot.define do
  password = Faker::Internet.password(6)

  factory :product do
    name                    {"商品名"}
    description             {"商品説明"}
    category_id             {"1"}
    price                   {"500"}
    condition               {1}
    shipping_fee            {1}
    shipping_method         {1}
    shipping_from           {1}
    shipping_term           {1}
  end

 end
