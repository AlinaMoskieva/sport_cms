20.times do
  Hashtag.create!(hashtag: "#{Faker::Lorem.word}#{Faker::Number.number(2)}" )
end

