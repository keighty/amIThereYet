namespace :db do
  desc "Fill database with sample data"
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

      title = "Title #{n+1}"
      body = "body #{n+1}, " * 37
      Post.create!(title: title, body: body)
    end

  end
end
