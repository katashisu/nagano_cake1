class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer, only: [:show, :edit, :update, :destroy]

  def new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if @cart_items.empty?
      flash[:notice] = "カートが空です！"
      redirect_to public_cart_items_path
    else
      @order = Order.new
      @customer = Customer.find(current_customer.id)
      @deliveries = current_customer.deliveries.all
    end
  end

  def create_session
    session[:order] = Order.new(order_params)
    session[:order]["customer_id"] = current_customer.id
    if params[:order]["selected_address"].to_i == 1
      session[:order]["postal_code"] = current_customer.postal_code
      session[:order]["address"] = current_customer.address
      session[:order]["name"] = current_customer.last_name + current_customer.first_name
    elsif params[:order]["selected_address"].to_i == 2
      @delivery = Delivery.where(customer_id: current_customer.id)
      if @delivery.empty?
        flash[:notice] = '新しいお届け先を入力してください'
        redirect_to new_public_order_path and return
      else
        delivery = Delivery.find(params[:order][:delivery])
        session[:order]["postal_code"] = delivery.postal_code
        session[:order]["address"] = delivery.address
        session[:order]["name"] = delivery.name
      end
    else
      session[:order]["postal_code"] = params[:order][:postal_code]
      session[:order]["address"] = params[:order][:address]
      session[:order]["name"] = params[:order][:name]
      if session[:order]["postal_code"].empty?
          flash[:notice] = '新しいお届け先を入力してください'
          redirect_to new_public_order_path and return
      elsif session[:order]["address"].empty?
          flash[:notice] = '新しいお届け先を入力してください'
          redirect_to new_public_order_path and return
      elsif session[:order]["name"].empty?
          flash[:notice] = '新しいお届け先を入力してください'
          redirect_to new_public_order_path and return
      end
    end
    session[:order]["shipping_cost"] = 800
    session[:order]["payment_method"] = order_params[:payment_method]
    redirect_to public_order_confirm_path and return
  end

  def confirm
    @order = Order.new(session[:order])
    @total_payment = current_customer.cart_item_total + @order.shipping_cost
    @cart_items = CartItem.all
    @customer_id = current_customer.id
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

  def correct_customer
    @order = Order.find(params[:id])
    if current_customer.id != @order.customer_id
        redirect_to customer_orders_path
    end
end

end
