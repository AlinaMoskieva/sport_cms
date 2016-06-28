FactoryGirl.define do
  factory :comment do
    body "Test comment"
    user
    page
  end
end
