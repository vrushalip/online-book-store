class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("created_at asc")
  end

  def new
    @cart_items = current_user.cart_items
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm_order
    @order = current_user.orders.build
    @order.confirm_order(current_user)
    flash[:notice] = "Order has been placed successfully."
    redirect_to root_path
  end
end
