after :categories do
  30.times do |page|
    Page.create!(body: Faker::Lorem.paragraph(20),
                 title: Faker::Lorem.sentence(3, true, 4),
                 category_id: Faker::Number.between(1, 10),
                 user_id: Faker::Number.between(1, User.count))
  end
end
