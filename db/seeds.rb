require 'faker'

10.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..100.0),
    description: Faker::Lorem.sentence(word_count: 10),
    approximate_dimensions: "#{rand(10..100)} cm x #{rand(10..100)} cm x #{rand(10..100)}cm"
  )
end

User.create!(
  email: 'default_user@example.com',
  password: 'password123'
)
