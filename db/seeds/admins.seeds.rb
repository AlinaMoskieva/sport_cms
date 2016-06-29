3.times do
  User.create!(email: Faker::Internet.email,
              full_name:  Faker::Name.name ,
              nickname: Faker::Name.first_name,
              role: "administrator" )
end
