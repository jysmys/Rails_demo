FactoryBot.define do
  factory :comment do
    commenter { "NoBody Special" }
    body { "Why are you writing this" }
    article { nil }
  end
end
