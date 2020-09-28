class Public::CustomersController < ApplicationController

	before_action :authenticate_customer!

def show
  
end

# def edit
  
# end

# def update
#   # @customer = Customer.current_customer
#   # if @customer.update
#   # 	redirect_to public_customers_my_page_path
#   # else
#   # 	render :edit
#   # end

# end

def exit
  
end

def withdraw
  customer = current_customer
  customer.update(is_deleted: true)
  reset_session
  flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  redirect_to public_root_path
end

def password
	
end


end
