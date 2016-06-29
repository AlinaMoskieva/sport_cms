after :category do
admin = Users.find(1)
  20.times do |page|
    admin.page.create!(body: Faker::Lorem.paragraphs,
                      title: Faker::Lorem.sentence(3, true, 4),
                      category_id: Faker::Number.between(1, Category.length))
  end
end
