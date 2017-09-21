FactoryGirl.define do
  factory :item do
    association :product
    quantity 1
    price 20.20
  end
end
