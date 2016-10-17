class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]
  require 'date'

  # GET /operators
  # GET /operators.json
  def index
    @operators = Operator.all
  end

  def operator_main_page

  end

  def new_orders_page
    @new_orders_page = new_orders_page_array
  end

  def in_progress_orders_page
    @in_progress_orders_page = in_progress_orders_page_array
  end

  def unpaid_orders_page
    @orders_awaiting_charge = unpaid_orders_page_array
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end

  # POST /operators
  # POST /operators.json
  def create
    temp = operator_params[:company_email]
    @operator = Operator.new(operator_params)
    @operator.company_email = temp.concat("@operator.onthespot.com.au")
    if @operator.save
      flash[:success] = "Operator account successfully created"
      redirect_to user_login_path

    else
      render 'new'
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'Operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url, notice: 'Operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit(:first_name, :last_name, :company_email, :password)
    end

    def unpaid_orders_page_array
      orders = []
      counter = 1

      # for each unpaid order
      unpaid_orders_id.each do |id|

        puts "STRING IS: " + id.to_s



        # fetch actual values
        sender_name_var = sender_name(id)
        customer_id = customer_id(id)

        time = time_value(id)
        collapse = collapse_value(counter)
        amount_to_charge = amount_to_charge(id)

        # load into array
        orders << [id, sender_name_var, customer_id, time, collapse, amount_to_charge]
        # increment counter
        counter += 1
      end
      return orders
    end

    def new_orders_page_array
      orders = []
      counter = 1

      # for each new order
      new_orders_id.each do |id|

        # fetch helper values
        track = tracker_value_id(id)

        # fetch actual values
        sender_name_var = sender_name(id)
        recipient_name_var = recipient_name(id)

        time = time_value(id)
        collapse = collapse_value(counter)
        status = status_value(track)

        # load into array
        orders << [id, sender_name_var, recipient_name_var, time, collapse, status]
        # increment counter
        counter += 1
      end
      return orders
    end

    def sender_name( id )
      customer_id = Order.find(id).customer_id
      # safeguard against bad data
      if customer_id != nil
        full_name = Customer.find(customer_id).first_name + " " + Customer.find(customer_id).last_name
      else
        full_name = "ERROR!"
      end
      puts 'SENDER NAME IS: ' + full_name
      return full_name
    end

  def customer_id( id )
    customer_id = Order.find(id).customer_id
    # safeguard against bad data
    if customer_id != nil
      return customer_id
    else
      return 0
    end
  end

  def amount_to_charge( id )
    temp = Pickup.find_by order_id: id
    if temp == nil
      return "ERROR!"
    else
      puts "VALUE IS" + temp[:charge]
      return "$" + temp[:charge].to_s
    end
  end

    def recipient_name( id )
      return Order.find(id).receiver_name
    end

    def in_progress_orders_page_array
      orders = []
      counter = 1

      # for each new order
      in_progress_orders_id.each do |id|

        # fetch values
        tracker = tracker_value_id(id)
        percentage = percentage(tracker)
        time = time_value(id)
        collapse = collapse_value(counter)
        status = status_value(tracker)

        # load into array
        orders << [id, tracker, percentage, time, collapse, status]
        # increment counter
        counter += 1
      end
      return orders
    end

    def new_orders_id
      @order_array = Order.all
      @array = Array.new
      @order_array.each do |order|
        if !Pickup.exists?(:order_id => order[:id])
          @array.push(order[:id])
        end
      end
      return @array
    end

  def unpaid_orders_id
    @order_array = Pickup.all
    @array = Array.new
    @order_array.each do |order|
      if !Payment.exists?(:order_id => order[:id])
        @array.push(order[:id])
      end
    end
    return @array
  end

  def in_progress_orders_id
    @pickup_array = Pickup.all
    @array = Array.new
    @pickup_array.each do |pickup_order|
      if !Deliver.exists?(:order_id => pickup_order[:order_id])
        @array.push(pickup_order[:order_id])
      end
    end
    return @array
  end

    def tracker_value_id( order_id )
      counter = 0
      if Pickup.exists?(:order_id => order_id)
        counter += 1
      end
      if Checkingin.exists?(:order_id => order_id)
        counter += 1
      end
      if Deliver.exists?(:order_id => order_id)
        counter += 1
      end
      return counter.to_i
    end

    def percentage( tracker )
      if tracker == 0
        return 0
      elsif tracker == 1
        return 33
      elsif tracker == 2
        return 66
      elsif tracker == 3
        return 100
      else
        return "Error"
      end
    end

    def time_value( order_id )

      if order_id != nil
        return Order.find(order_id).created_at
      else
        return "ERROR!"
      end

    end

    def collapse_value( value )
      return "collapse" + in_words(value)
    end

    def status_value( tracker )
      if tracker == 0
        return "Order Placed"
      elsif tracker == 1
        return "Order Picked Up"
      elsif tracker == 2
        return "Order Checked into Warehouse"
      elsif tracker == 3
        return "Order Delivered"
      else
        return "Error"
      end
    end

  # Method to convert number into readable text, this is used to correctly label
  # the id's of the panels so that collapsing will work correctly.
  def in_words(int)
    numbers_to_name = {
        1000000 => "Million",
        1000 => "Thousand",
        100 => "Hundred",
        90 => "Ninety",
        80 => "Eighty",
        70 => "Seventy",
        60 => "Sixty",
        50 => "Fifty",
        40 => "Forty",
        30 => "Thirty",
        20 => "Twenty",
        19 => "Nineteen",
        18 => "Eighteen",
        17 => "Seventeen",
        16 => "Sixteen",
        15 => "Fifteen",
        14 => "Fourteen",
        13 => "Thirteen",
        12 => "Twelve",
        11 => "Eleven",
        10 => "Ten",
        9 => "Nine",
        8 => "Eight",
        7 => "Seven",
        6 => "Six",
        5 => "Five",
        4 => "Four",
        3 => "Three",
        2 => "Two",
        1 => "One"
    }
    str = ""
    numbers_to_name.each do |num, name|
      if int == 0
        return str
      elsif int.to_s.length == 1 && int/num > 0
        return str + "#{name}"
      elsif int < 100 && int/num > 0
        return str + "#{name}" if int%num == 0
        return str + "#{name}" + in_words(int%num)
      elsif int/num > 0
        return str + in_words(int/num) + "#{name}" + in_words(int%num)
      end
    end
  end

end
