class SessionsController < ApplicationController

  CUSTOMER = 1
  DRIVER = 2
  OPERATOR = 3

  def new

  end

  def create
    if find_user_type == CUSTOMER
      auth_customer
    end
    if find_user_type == DRIVER
      auth_driver
    end
    if find_user_type == OPERATOR
      auth_operator
    end
  end

  def destroy
    session[:user_id] = nil
    session[:driver_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  def find_user_type
    domain = params[:session][:email].split("@")[1]
    puts "The domain of the user is: " + domain
    if domain == "driver.onthespot.com.au"
      return DRIVER
    end
    if domain == "operator.onthespot.com.au"
      return OPERATOR
    else
      return CUSTOMER
    end
  end

  def auth_customer
    customer = Customer.find_by(email: params[:session][:email])
    if customer && customer.authenticate(params[:session][:password])
      session[:user_id] = customer.id
      flash[:success] = "You have successfully logged in"
      redirect_to main_page_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def auth_driver
    driver = Driver.find_by(company_email: params[:session][:email])
    if driver && driver.authenticate(params[:session][:password])
      session[:driver_id] = driver.id
      flash[:success] = "You have successfully logged in"
      redirect_to driver_management_page_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

end