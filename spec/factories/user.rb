FactoryGirl.define do
  factory :user do
    email { generate :email }
    first_name { generate :string }
    last_name { generate :string }
    password 'password'
    password_confirmation 'password'
  end
end
