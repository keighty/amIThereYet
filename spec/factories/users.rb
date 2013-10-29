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

    goals { Array.new(1) { FactoryGirl.build(:goal) } }
  end

  factory :post do
    title "Hello Post"
    body  "Hello Post Body"
  end

end