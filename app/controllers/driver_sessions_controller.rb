class DriverSessionsController < ApplicationController

  def new

  end

  def create
    driver = Driver.find_by(company_email: params[:session][:company_email])
    if driver && driver.authenticate(params[:session][:password])
      session[:driver_id] = driver.id
      flash[:success] = "You have successfully logged in"
      redirect_to driver_management_page_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:driver_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end