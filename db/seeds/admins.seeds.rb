User.create!(email: "admin@example.com",
            full_name:  Faker::Name.name,
            password: "1234567890",
            nickname: Faker::Name.first_name,
            role: :admin,
            confirmed_at: DateTime.now )
