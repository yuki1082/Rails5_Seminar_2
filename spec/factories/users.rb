FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "Taro#{n}" }
    sequence(:full_name) {|n| "rails_Taro#{n}"}
    password "password"

    factory(:user_with_plan_items) do
      after(:create) do |created_user|
        3.times do
          create(:plan_item, user: created_user)
        end
      end
    end
    
  end
end
