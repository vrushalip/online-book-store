require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:product)   { FactoryGirl.build(:product) }
  let(:user)      { FactoryGirl.create(:user) }
  let(:order)      { FactoryGirl.create(:order) }
  let(:user_item) { FactoryGirl.build(:item, itemable: user) }
  let(:order_item) { FactoryGirl.build(:item, itemable: order) }

  it 'has a valid user item factory' do
    expect(user_item).to be_valid
  end

  it 'has a valid order item factory' do
    expect(order_item).to be_valid
  end
end
