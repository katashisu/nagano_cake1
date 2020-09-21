class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def confirm
    
  end

  def thanks
    
  end

  def create
    
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

 
end
