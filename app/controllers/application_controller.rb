class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_customer, :customer_logged_in?, :require_customer, :require_driver, :driver_logged_in?

  def anyone_logged_in

  end

  def current_customer
    @current_customer ||= Customer.find(session[:user_id]) if session[:user_id]
  end

  def current_driver
    @current_driver ||= Driver.find(session[:driver_id]) if session[:driver_id]
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

  def require_driver
    if !driver_logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
