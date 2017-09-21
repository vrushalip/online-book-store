require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  before do
    @product = FactoryGirl.create(:product)
    @user = FactoryGirl.create(:user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)
  end

  describe "GET #add_to_cart" do
    it "add product to cart" do
      expect {
        xhr :get, :add_to_cart, {product_id:  @product.id}
      }.to change(Item, :count).by(1)
    end
  end

  describe "GET #remove_from_cart" do
    it "remove product from cart" do
      FactoryGirl.create(:item, itemable: @user, product: @product)
      expect {
        xhr :delete, :remove_from_cart, {product_id:  @product.id}
      }.to change(Item, :count).by(-1)
    end
  end
end
