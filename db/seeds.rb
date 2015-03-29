

papa_ham = Farmer.create(name: "papa ham", email: "farm@poop.com", password: "ilovemyfamily")
mama_ham = Farmer.create(name: "mama ham", email: "mamafood@poop.com", password: "familyisokay")

5.times do
  Pig.create(farmer: mama_ham, name: Faker::Name.name, weight: Faker::Number.number(2), past_life_identity: Faker::Lorem.word)
  end


  5.times do
  Pig.create(farmer: papa_ham, name: Faker::Name.name, weight: Faker::Number.number(2), past_life_identity: Faker::Lorem.word)
  end

