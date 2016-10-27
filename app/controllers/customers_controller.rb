# Customers Controller
#
# Contains helper methods and code-behind for 'customer' objects
# and their corresponding views and model

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "Customer account successfully created"
      redirect_to user_login_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update

  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:username, :first_name, :last_name, :card_no, :card_type, :ccv, :card_expiry, :street, :suburb, :postcode, :city, :email, :password)
    end
end
