FactoryBot.define do
  password = Faker::Internet.password(6)

  factory :user do
    nickname                {Faker::Name.last_name}
    email                   {Faker::Internet.free_email}
    password                {password}
    password_confirmation   {password}
  end

 end
