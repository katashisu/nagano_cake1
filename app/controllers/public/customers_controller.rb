class Public::CustomersController < ApplicationController

def show
  
end

def edit
  
end

def update
  
end

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
