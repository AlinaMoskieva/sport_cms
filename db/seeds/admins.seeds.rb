3.times do
  User.create!(email: Faker::Internet.email,
              full_name:  Faker::Name.name,
              password: Faker::Internet.password,
              nickname: Faker::Name.first_name,
              role: 1,
              confirmed_at: DateTime.now )
end
