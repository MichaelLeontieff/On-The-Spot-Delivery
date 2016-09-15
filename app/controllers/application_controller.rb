class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_customer, :customer_logged_in?, :require_customer

  def current_customer
    @current_customer ||= Customer.find(session[:user_id]) if session[:user_id]
  end

  def current_driver
    #@current_user ||= Customer.find(session[:user_id]) if session[:user_id]
  end

  def current_operator
    #@current_user ||= Customer.find(session[:user_id]) if session[:user_id]
  end

  def customer_logged_in?
    !!current_customer
  end

  def driver_logged_in?
    !!current_driver
  end

  def operator_logged_in?
    !!current_operator
  end

  def require_customer
    if !customer_logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
