# Payments Controller
#
# Contains helper methods and code-behind for 'payment' objects
# and their corresponding views and model

class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @customer_id = params[:user_id]
    @order_pass_id = params[:order_id]
    @info = fetch_payment_information
    @names_array = fetch_payment_labels
  end

  def fetch_payment_information
    info = Array.new
    customer = Customer.find(params[:user_id])

    # 2, 3, 4, 5, 6, 7

    # add values
    if customer != nil
      info << customer[:first_name]
      info << customer[:last_name]
      info << customer[:card_no]
      info << customer[:card_type]
      info << customer[:ccv]
      info << customer[:card_expiry]
    else
      return "ERROR"
    end

    return info
  end

  def fetch_payment_labels
    return ["First Name", "Last Name", "Card Number", "Card Type", "CCV", "Card Expiry"]
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.paid = "Yes"
    respond_to do |format|
      if @payment.save
        flash[:success] = "Payment Process Complete"
        format.html { redirect_to @payment }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:order_id, :paid, :user_id, :order_id)
    end
end
