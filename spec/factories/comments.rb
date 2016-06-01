FactoryGirl.define do
  factory :comment do
    body "Test"
    user
    page
  end
end
