namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.create!(name: "Irene Ball",
                 email: "irene@example.com",
                 password: "eyeba77",
                 password_confirmation: "eyeba77",
                 username: "myrene",
                 admin: true)

    goal = {  description: "Primary goal",
              motivation: "Because I'm worth it." }
    user.goals.create!(goal)

    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      username = "example-#{n+1}"
      User.create!(name: name,
                   email: email,
                   username: username,
                   password: password,
                   password_confirmation: password)

      title = "Title #{n+1}"
      body = "body #{n+1}, " * 37
      p = Post.create!(title: title, body: body)
      n.times do |x|
        p.comments.create(body: "This is a comment", user_id: n+1)
      end
    end

  end
end
