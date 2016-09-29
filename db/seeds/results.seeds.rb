after :pages do
  10.times do
    Result.create!(category_id: Faker::Number.between(1, Category.count),
                   country: Faker::Address.country_code,
                   prize: Faker::Lorem.word,
                   sportsmen: Faker::Name.name,
                   competition: Faker::Lorem.word,
                   page_id: Faker::Number.between(1, Page.count)
                  )
  end
  10.times do
    Result.create!(category_id: Faker::Number.between(1, Category.count),
                   prize: Faker::Lorem.word,
                   competition: Faker::Lorem.word,
                   page_id: Faker::Number.between(1, Page.count),
                   first_team: Faker::Team.name,
                   second_team: Faker::Team.name,
                   first_team_result: Faker::Number.decimal(2, 3),
                   second_team_result: Faker::Number.decimal(2, 3),
                   first_team_members: Faker::Name.name,
                   second_team_members: Faker::Name.name,
                   first_team_country: Faker::Address.country_code,
                   second_team_country: Faker::Address.country_code
                  )
  end
end
