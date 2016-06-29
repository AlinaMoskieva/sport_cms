after :categories do
admin = User.find(1)
  20.times do |page|
    admin.pages.create!(body: Faker::Lorem.paragraphs,
                      title: Faker::Lorem.sentence(3, true, 4),
                      category_id: Faker::Number.between(1, 10))
  end
end
