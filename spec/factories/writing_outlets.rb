FactoryBot.define do
  factory :writing_outlet do
    title { "Sample Title" }
    content { "Sample Content" }
    association :author
  end
end
