FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "cookies"
    first_name "Fred"
    last_name "Smith"
    email_list false
    home_school false
    subscription false
    admin false
  end

  factory :admin, class: User do
    email
    password "flowers"
    first_name "George"
    last_name "Jones"
    email_list true
    home_school true
    subscription false
    admin true
  end
  
end
