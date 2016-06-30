after :pages do
  10.times do
    Result.create!(category_id: Faker::Number.between(1, 10),
                   country: "RU",
                   prize: Faker::Lorem.word,
                   sportsmen: Faker::Name.name,
                   competition: Faker::Lorem.word,
                   page_id: Faker::Number.between(1,20)
                  )
  end
  10.times do
    Result.create!(category_id: Faker::Number.between(1, 10),
                   prize: Faker::Lorem.word,
                   competition: Faker::Lorem.word,
                   page_id: Faker::Number.between(1,20),
                   first_team: Faker::Team.name,
                   second_team: Faker::Team.name,
                   first_team_result: Faker::Number.decimal(2, 3),
                   second_team_result: Faker::Number.decimal(2, 3),
                   first_team_members: Faker::Name.name,
                   second_team_members: Faker::Name.name,
                   first_team_country: "GB",
                   second_team_country: "RU"
                  )
  end
end
