class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("created_at desc")
  end

  def new
    @cart_items = current_user.cart_items
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm_order
    total_price = 0
    @order = current_user.orders.build
    @order.confirm_order
    current_user.cart_items.each do |cart_item|
      price = cart_item.quantity * cart_item.product.price
      total_price += price
      @order.order_items.build(quantity: cart_item.quantity, price: price, product_id: cart_item.product_id)
    end
    @order.total_price = total_price
    @order.save
    current_user.cart_items.destroy_all
    flash[:notice] = "Order has been placed successfully."
    redirect_to root_path
  end
end
