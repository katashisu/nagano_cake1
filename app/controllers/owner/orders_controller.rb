class Owner::OrdersController < ApplicationController

  def index
    @orders = Order.all.includes(:customers)
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id:params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to owner_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :postal_code, :address, :order_status)
  end

end
