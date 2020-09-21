class Public::OrdersController < ApplicationController

  def new
    
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @custommer_id = current_custommer.id
    @order.shipping_cost = 800
  end

  def thanks
    
  end

  def create
    
  end

  def index
    
  end

  def show
    
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :adress, :name, :shipping_cost, :total_payment, :payment_method)
  end

end
