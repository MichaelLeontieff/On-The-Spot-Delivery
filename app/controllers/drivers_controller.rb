class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  def driver_main_page
    @names = Customer.where(:id => Order.select("customer_id"))
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    temp = driver_params[:company_email]
    @driver = Driver.new(driver_params)
    @driver.company_email = temp.concat("@driver.onthespot.com.au")
    if @driver.save
      flash[:success] = "Driver account successfully created"
      redirect_to driver_login_path

    else
      render 'new'
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def return_customers_table
    @customers = Customer.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:first_name, :last_name, :company_email, :assigned_truck_rego, :password)
    end
end
