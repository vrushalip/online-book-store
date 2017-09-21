module CartHelper
	def total_product_price(cart_item)
		if(cart_item.is_a?(Hash))
			cart_item["quantity"].to_f * cart_item["price"].to_f
		elsif cart_item.present?
			cart_item.quantity.to_f * (cart_item.product.try(:price).to_f || cart_item.price.to_f)
		else
			nil
		end
	end
end
