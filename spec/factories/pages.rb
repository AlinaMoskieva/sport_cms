FactoryGirl.define do
  factory :page do
    title "Test page"
    body "test body"
    user
    category
  end
end
