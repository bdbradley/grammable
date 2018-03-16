FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "secretPassword"
    password_confirmation "secretPassword"
  end


  factory :gram do
    message "hello"
    association :user
  end
end