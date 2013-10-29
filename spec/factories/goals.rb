FactoryGirl.define do
  factory :goal do
    description "my goal"
    motivation "my motivation"

    hours { Array.new(3) { FactoryGirl.build(:hour) } }

  end
end