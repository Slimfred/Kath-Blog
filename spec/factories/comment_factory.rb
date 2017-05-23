FactoryGirl.define do
  sequence(:body) { |n| "This is comment number#{n}" }

  factory :comment do
    body
    user
    article
  end
end
