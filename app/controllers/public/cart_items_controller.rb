class Public::CartItemsController < ApplicationController
def index
	@cart_items = current_customer.cart_items
end

def create
	@cart_item = CartItem.new(cart_item_params)

	@item = Item.find(params[:cart_item][:item_id])#item_idを取得
	@cart_item.customer_id = current_customer.id #customer_idを取得

	if @cart_item.save!
	   redirect_to public_cart_items_path
	else redirect_to public_items_path
	end

end

def update
end

def destroy_all
	@cart_items = current_customer.cart_items
	@cart_items.destroy_all
	redirect_to public_cart_items_path
end

def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to public_cart_items_path
end

private
def cart_item_params
	params.require(:cart_item).permit(:amount, :item_id)
end

end