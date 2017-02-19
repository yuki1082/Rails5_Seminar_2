FactoryGirl.define do
  factory :plan_item do
  	user
    sequence(:name) {|n| "plan_item#{n}"}
    description "hoge foo bar"
    starts_at 2.weeks.ago
    ends_at 3.weeks.from_now
  end
end
