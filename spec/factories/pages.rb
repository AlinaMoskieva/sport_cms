FactoryGirl.define do
  factory :page do
    title "Test page"
    body "test body"
    user
    category
    visitors 2
    comments_count 0
  end
end
