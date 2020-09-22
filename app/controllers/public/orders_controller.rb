class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @deliveries = current_customer.deliveries.all

  end

  def confirm
    session[:order] = Order.new(order_params)
    session[:order]["customer_id"] = current_customer.id
    if params[:order]["selected_address"].to_i == 1
      session[:order]["postal_code"] = current_customer.postal_code
      session[:order]["address"] = current_customer.address
      session[:order]["name"] = current_customer.last_name + current_customer.first_name
    elsif params[:order]["selected_address"].to_i == 2
      delivery = Delivery.find(params[:order][:delivery])
      session[:order]["postal_code"] = delivery.postal_code
      session[:order]["address"] = delivery.address
      session[:order]["name"] = delivery.name
    else
      delivery = Delivery.new(delivery_params)
      delivery.customer_id = current_customer.id
      delivery.save
      session[:order]["postal_code"] = delivery.postal_code
      session[:order]["address"] = delivery.address
      session[:order]["name"] = delivery.name
    end
    session[:order]["shipping_cost"] = 800
    session[:order]["payment_method"] = order_params[:payment_method]

    @order = session[:order]
    @cart_items = CartItem.all
    @customer_id = current_customer.id
    @order.shipping_cost = 800

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.amount = cart_item.amount
      @order_item.buying_price = cart_item.item.price
      @order_item.save
      cart_item.destroy
    end
    @selected_address = params[:selected_address]
      if @address_select == 3
          @delivery = Delivery.new
          @delivery.customer_id = current_customer.id
          @delivery.postal_code = @order.postal_code
          @delivery.address = @order.address
          @delivery.name = @order.name
          @delivery.save
      end
    redirect_to public_orders_thanks_path
  end

  def thanks
    
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :customer_id)
  end

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name, :customer_id)
  end
 
end
