# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(fullname: 'User 01', email: 'user@user.com', password:'user123', password_confirmation:'user123')

4.times do |n|
  User.create!(fullname: Faker::Name.name, email:"user#{n}@user.com", password:'user123', password_confirmation: 'user123')
end

35.times do
  Tweet.create(user_id: User.all.sample.id, declaration: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true))
end