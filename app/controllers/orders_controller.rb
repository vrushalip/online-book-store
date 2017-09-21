class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @cart_items = current_user.cart_items
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm_order
    @order = current_user.orders.build
    @order.confirm_order
    flash[:notice] = "Order has been placed successfully."
    redirect_to root_path
  end
end
