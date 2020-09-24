class Owner::OrdersController < ApplicationController

  def index
    @orders = Order.all.includes(:customers)
    @orders = Order.page(params[:page])
  end

  def show
    
  end

  def update
    
  end

end
