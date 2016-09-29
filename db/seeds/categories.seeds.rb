15.times do
  Category.create!(category: "#{Faker::Lorem.word.capitalize}")
end
