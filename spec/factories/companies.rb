# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    company_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Array.new(10) { ('a'..'z').to_a.sample }.join }
  end
end
