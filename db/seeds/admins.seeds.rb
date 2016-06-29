3.times do
  User.create!(email: Faker::Internet.email,
              full_name:  Faker::Name.name ,
              password: Faker::Internet.password(10, 20, true),
              nickname: Faker::Name.first_name,
              role: "administrator" )
end
