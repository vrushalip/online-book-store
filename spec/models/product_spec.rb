require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.build(:product) }

  it 'has a valid factory' do
    expect(product).to be_valid
  end
end
