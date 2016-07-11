FactoryGirl.define do
  factory :comment do
    body "Test comment"
    association :author, factory: :user
    page
  end
end
