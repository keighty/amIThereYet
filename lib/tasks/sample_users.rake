namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.create!(name: "Irene Ball",
                 email: "irene@example.com",
                 password: "eyeba77",
                 password_confirmation: "eyeba77",
                 username: "myrene",
                 admin: true)

    goal = user.goals.create!(description: "Primary goal",
                motivation: "Because I'm worth it." )

    5.times do |n|
      goal.hours.create!(duration: 100*(n+1), category: "class #{n+1}", description: "lecture about #{n+1} things")
    end

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
