FactoryGirl.define do
  factory :page do
    title "Test page"
    body "test body"
    user_id 1
    position "top_menu"
    theme "sport"
  end
end
