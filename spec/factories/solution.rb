require 'faker'

FactoryGirl.define do
  factory :solution do |f|
    f.title {Faker::Hacker.say_something_smart}
    f.description {Faker::Hacker.say_something_smart}
  end
end
