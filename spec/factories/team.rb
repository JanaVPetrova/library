FactoryGirl.define do
  factory :team do
    title { generate :string }
    description { generate :string }
  end

  trait :with_user do
    after :create do |team|
      create :user, team: team
    end
  end
end
