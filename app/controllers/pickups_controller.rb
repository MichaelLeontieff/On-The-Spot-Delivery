# Pickups Controller
#
# Contains helper methods and code-behind for 'checkingin' objects
# and their corresponding views and model

class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]

  # GET /pickups
  # GET /pickups.json
  def index
    @pickups = Pickup.all
  end


  # GET /pickups/1
  # GET /pickups/1.json
  def show
  end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
    @array = generate_orders_array
  end

  def generate_orders_array
    order_array = Order.all
    array = Array.new
    order_array.each do |order|
      if !Pickup.exists?(:order_id => order[:id])
        array.push(order[:id])
      end
    end
    return array
  end

  # GET /pickups/1/edit
  def edit
  end

  # POST /pickups
  # POST /pickups.json
  def create
    @pickup = Pickup.new(pickup_params)

    respond_to do |format|
      if @pickup.save
        flash[:success] = "Pickup Process Submitted"
        format.html { redirect_to @pickup }
        format.json { render :show, status: :created, location: @pickup }
      else
        format.html { render :new }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/1
  # PATCH/PUT /pickups/1.json
  def update
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to @pickup, notice: 'Pickup was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1
  # DELETE /pickups/1.json
  def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to pickups_url, notice: 'Pickup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_params
      params.require(:pickup).permit(:order_id, :signature, :charge)
    end
end
