namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Irene Ball",
                 email: "irene@example.com",
                 password: "eyeba77",
                 password_confirmation: "eyeba77",
                 admin: true)
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
      p = Post.create!(title: title, body: body)
      n.times do |x|
        p.comments.create(body: "This is a comment")
      end
    end

  end
end
