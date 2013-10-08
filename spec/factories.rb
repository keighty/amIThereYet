FactoryGirl.define do
  factory :user do
    name     "Hello World"
    email    "hello.world@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end