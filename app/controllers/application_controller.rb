class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart_items

  def set_cart_items
    session[:cart] ||= {}
  end

  def after_sign_in_path_for(resource)
    session[:cart].each do |product_id, attributes|
      cart_item = current_user.cart_items.where(product_id: product_id).first_or_initialize
      cart_item.quantity = cart_item.quantity.to_i + attributes["quantity"].to_i
      cart_item.price = attributes["price"].to_f
      cart_item.save
    end
    session[:cart] = {}
    root_path
  end
end
