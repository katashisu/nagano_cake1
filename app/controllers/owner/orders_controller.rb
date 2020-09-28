class Owner::OrdersController < ApplicationController

    before_action :authenticate_owner!

  def index
    @orders = Order.all.order(id: "DESC").page(params[:page])
    #.includes(:customers)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id:params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    # order_statusが入金確認ならば、紐づくmaking_statusを製作待ちへ自動更新
    if @order.order_status == "入金確認"
       @order.order_items.each do |order_item|
       order_item.update(making_status:"製作待ち" )
       end
    end
    redirect_to owner_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :postal_code, :address, :order_status)
  end

end
