class CustomerSessionsController < ApplicationController

  def new

  end

  def create
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

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end