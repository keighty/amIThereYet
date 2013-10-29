FactoryGirl.define do
  factory :alert do
    zipcode { Array.new(3) { FactoryGirl.build(:zipcode) } }
  end
end