FactoryGirl.define do
  factory :book do
    title { generate :string }
    description { generate :string }
    author { generate :string }
    url { generate :url }
  end

  factory :published_program, parent: :book do
    state_event 'publish'
  end
end
