# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Employee.create(
    name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    current_position: Faker::Job.title,
    birthdate: Faker::Date.birthday(min_age: 25, max_age: 45),
    date_of_employing: Faker::Date.between(from: '2021-01-01', to: '2021-09-01'),
    email: Faker::Internet.email
  )
end