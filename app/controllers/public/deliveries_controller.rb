class Public::DeliveriesController < ApplicationController


  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
    @customer = current_customer
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @deliveries = Delivery.all
    @delivery.customer_id = current_customer.id
    if @delivery.save(delivery_params)
      redirect_to public_deliveries_path
    else
      @customer = current_customer
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
    redirect_to public_deliveries_path
    else
      render :edit
    end

  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to public_deliveries_path
  end


  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end

end
