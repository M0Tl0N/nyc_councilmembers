10.times do
  Restaurant.create(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.phone_number
    )
end

10.times do
  Review.create(
    user_id: rand(1..5),
    restaurant_id: rand(0..10),
    comment: Faker::Lorem.paragraph,
    rating: rand(1..5),
    reviewed_on: Faker::Date.backward(365)
    )
end

(1..10).each do |n|
  Address.create(
    restaurant_id: n,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
    )
end

5.times do
  User.create(
    name: Faker::Name.name,
    city: Faker::Address.city,
    email: Faker::Internet.email,
    password_hash: Faker::Lorem.word
  )
end
