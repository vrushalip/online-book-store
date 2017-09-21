require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    @product = FactoryGirl.create(:product)
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:order, user: @user)
    @orders = Order.all
    allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)
  end

  describe "GET #index" do
    it "assigns all orders as @orders" do
      get :index
      expect(assigns(:orders)).to eq([@order])
    end
  end

  describe "GET #confirm_order" do
    it "confirm an order" do
      FactoryGirl.create(:item, itemable: @user, product: @product)
      get :confirm_order
      expect(@user.cart_items.length).to eq(0)
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      get :show, {:id => @order.id}
      expect(assigns(:order)).to eq(@order)
    end
  end
end
