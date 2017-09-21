class Order < ActiveRecord::Base
	## Associations
  has_many :order_items, as: :itemable, class_name: 'Item'
  belongs_to :user
  ##Methods

  #For creating order items
  def confirm_order(user)
		total_price = 0
		cart_items = user.cart_items
		cart_items.each do |cart_item|
      price = cart_item.quantity * cart_item.product.price
      total_price += price
      self.order_items.build(quantity: cart_item.quantity, price: price, product_id: cart_item.product_id)
    end
    self.total_price = total_price
    self.save
    user.cart_items.destroy_all
  end
end
