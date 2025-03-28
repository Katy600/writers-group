FactoryBot.define do
  factory :author do
    name { "Jeff Morhous" }
    sequence(:email) { |n| "author#{n}@example.com" }
    password { "password123" }
  end

  factory :writing_outlets do
    title { "Sample Title" }
    content { "Sample Content" }
    author
  end
end