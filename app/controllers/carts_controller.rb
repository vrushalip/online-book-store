class CartsController < ApplicationController

  def index
    @products = Product.where(id: session[:cart].keys) unless user_signed_in?
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    if current_user
      @cart_item = current_user.cart_items.where(product_id: params[:product_id]).first_or_initialize
      if params[:quantity].present?
        @cart_item.quantity = params[:quantity]
      else
        @cart_item.quantity = @cart_item.quantity ? @cart_item.quantity + 1 : 1
      end
      #@cart_item.price = @product.price * @cart_item.quantity
      @cart_item.price = @product.price
      @cart_item.save
    else
      session[:cart][params[:product_id]] ||= {}
      if params["quantity"].present?
        session[:cart][params[:product_id]]["quantity"] = params[:quantity]
      else
        session[:cart][params[:product_id]]["quantity"] = session[:cart][params[:product_id]]["quantity"].presence ? session[:cart][params[:product_id]]["quantity"].presence + 1 : 1
      end
      session[:cart][params[:product_id]]["price"] = @product.price
      #session[:cart][params[:product_id]]["price"] = session[:cart][params[:product_id]]["quantity"].to_f * @product.price.to_f
    end
    respond_to do |format|
      format.js
    end
  end

  def remove_from_cart
    if current_user
      current_user.cart_items.where(product_id: params[:product_id]).destroy_all
    else
      session[:cart].delete(params[:product_id])
    end
    respond_to do |format|
      format.js
    end
  end
end
