after :pages do
  40.times  do
    Comment.create!(user_id: Faker::Number.between(1, 3),
                    body: Faker::Lorem.sentence(3, true, 4),
                    page_id: Faker::Number.between(1, 20))
  end
end
