FactoryGirl.define do
  factory :order do
    association :user
    total_price '20.60'
  end
end
