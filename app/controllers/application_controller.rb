class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
    when Owner
       owner_homes_top_path
    when Customer
       public_items_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :owner
      new_owner_session_path
    elsif resource_or_scope == :customer
      public_root_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :email, :password, :password_confirmation])
    end

end
