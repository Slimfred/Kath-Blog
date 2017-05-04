FactoryGirl.define do

  sequence(:title) { |n| "Article Title #{n}"}

  factory :article do
    title
    subject "subject"
    body "This is an article written by Kath about school stuff.  I'm sure it will be interesting as she is good at being a teacher."
  end
end
