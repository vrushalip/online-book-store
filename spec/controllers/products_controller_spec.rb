require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    @product = Product.all
  end

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index
      expect(assigns(:products)).to eq(@product)
    end
  end
end
