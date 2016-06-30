after :pages do
  20.times do
    Hashtag.create!(hashtag: Faker::Lorem.word,
                    pages_id: Faker::Number.between(1, 20))
  end
end
