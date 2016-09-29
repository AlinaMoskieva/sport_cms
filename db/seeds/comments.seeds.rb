after :pages do
  60.times  do
    Comment.create!(user_id: Faker::Number.between(1, User.count),
                    body: Faker::Lorem.sentence(3, true, 4),
                    page_id: Faker::Number.between(1, Page.count))
  end
end
