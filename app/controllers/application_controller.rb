# Application Controller
#
# Contains helper methods for sessions management

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_customer, :user_logged_in?, :customer_logged_in?, :require_customer, :require_driver, :require_operator, :driver_logged_in?, :operator_logged_in?

  def anyone_logged_in

  end

  def current_customer
    @current_customer ||= Customer.find(session[:user_id]) if session[:user_id]
  end

  def current_driver
    @current_driver ||= Driver.find(session[:driver_id]) if session[:driver_id]
  end

  def current_operator
    @current_user ||= Operator.find(session[:operator_id]) if session[:operator_id]
  end

  def user_logged_in?
    return !!current_customer || !!current_driver || !!current_operator
  end

  def customer_logged_in?
    return !!current_customer
  end

  def driver_logged_in?
    return !!current_driver
  end

  def operator_logged_in?
    return !!current_operator
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

  def require_operator
    if !operator_logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
