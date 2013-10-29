FactoryGirl.define do
  factory :hour do
    duration { 100 * rand(36) }
    category "class time"
    description "lecture hall"
  end
end
