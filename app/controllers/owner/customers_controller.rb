class Owner::CustomersController < ApplicationController

    before_action :authenticate_owner!

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "更新が完了しました"
       redirect_to owner_customer_path
    else
    flash[:notice] = "更新に失敗しました"
    render 'edit'
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :phone, :is_deleted)
    end
end
