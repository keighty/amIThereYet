FactoryGirl.define do
  factory :user do
    name     "Hello World"
    email    "hello.world@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :post do
    sequence(:title)  { |n| "Title #{n}" }
    sequence(:body)   { |n| "body#{n}"}
  end
end