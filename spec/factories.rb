FactoryGirl.define do
  factory :user do
    name     "Hello World"
    email    "hello.world@example.com"
    password "foobar"
    password_confirmation "foobar"
    username "hello-y"

    factory :admin do
      admin true
    end
  end

  factory :post do
    sequence(:title)  { |n| "Title #{n}" }
    sequence(:body)   { |n| "body#{n}"}
  end

  factory :comment do
    body "comments"
  end
end