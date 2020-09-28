class Public::CartItemsController < ApplicationController

	before_action :authenticate_customer!

def index
	@cart_items = current_customer.cart_items
	@all_total_price = @cart_items.sum{|num| (num.item.price*1.1).floor*num.amount} #カート内合計金額
end

def create
	@cart_item = CartItem.new(cart_item_params)
	cart_item_before = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])#すでに保存した情報

	@cart_item.customer_id = current_customer.id #customer_idを取得

	if @cart_item.amount != nil

		if cart_item_before.present?

			total_amount = @cart_item.amount + cart_item_before.amount

			if total_amount <= 30
		 	cart_item_before.update(amount: total_amount)
		 	redirect_to public_cart_items_path
		 	else
		 		redirect_to public_item_path(@cart_item.item_id),notice:"最大数量は３０です"
		 	end

		else
		 	@cart_item.save
		 	redirect_to public_cart_items_path
		end

	else
		redirect_to public_item_path(@cart_item.item_id),notice:"数量を選択してください"
	end

end

def update
	@cart_item = CartItem.find(params[:id])

	if @cart_item.update(cart_item_params)
		redirect_to public_cart_items_path, notice: "変更の保存に成功しました"
	else
		redirect_to public_cart_items_path, notice: "1~30で数量を選択して下さい"
	end

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