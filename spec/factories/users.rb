FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "user#{n}@email.com"}
    name 'test user'
    password 'password123'
    password_confirmation 'password123'
    token 'sekret_token'
  end
end