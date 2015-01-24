FactoryGirl.define do
  factory :user do
    name "MyString"
    sequence :email do |n|
      "user_#{n}@itrack.com"
    end
    password "MyString"
    role nil
  end

end
