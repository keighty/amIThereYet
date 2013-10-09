namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
    User.create!(name: "Irene Ball",
                 email: "irene@example.com",
                 password: "eyeba77",
                 password_confirmation: "eyeba77")
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
