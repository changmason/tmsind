FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    branch_name { Faker::Company.suffix }
    telephone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    email { Faker::Internet.email }
    business_hours { "08:00 ~ 22:00" }
    charges { Faker::Lorem.sentence }
    main_type { Faker::IndustrySegments.sector }
    sub_type { Faker::IndustrySegments.sub_sector }
    company_no { Faker::Alphanumeric.alphanumeric(number: 8, min_numeric: 8) }
    lat_lng { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
  end
end
