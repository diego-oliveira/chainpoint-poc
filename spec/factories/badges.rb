FactoryBot.define do
  factory :badge do
    name { Faker::Lorem.sentence(word_count: 2) }
    issue_date { DateTime.current }
    uuid { Faker::Internet.uuid }
  end
end
