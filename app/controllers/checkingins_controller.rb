# Checkingin Controller
#
# Contains helper methods and code-behind for 'checkingin' objects
# and their corresponding views and model

class CheckinginsController < ApplicationController
  before_action :set_checkingin, only: [:show, :edit, :update, :destroy]

  # GET /checkingins
  # GET /checkingins.json
  def index
    @checkingins = Checkingin.all
  end

  # GET /checkingins/1
  # GET /checkingins/1.json
  def show
  end

  # GET /checkingins/new
  def new
    @checkingin = Checkingin.new
    @array = generate_orders_array
  end

  def generate_orders_array
    pickup_array = Pickup.all
    array = Array.new
    pickup_array.each do |order|
      if !Checkingin.exists?(:order_id => order[:order_id])
        array.push(order[:order_id])
      end
    end
    return array
  end

  # GET /checkingins/1/edit
  def edit
  end

  # POST /checkingins
  # POST /checkingins.json
  def create
    @checkingin = Checkingin.new(checkingin_params)

    respond_to do |format|
      if @checkingin.save
        flash[:success] = "Check-in Process Submitted"
        format.html { redirect_to @checkingin }
        format.json { render :show, status: :created, location: @checkingin }
      else
        format.html { render :new }
        format.json { render json: @checkingin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkingins/1
  # PATCH/PUT /checkingins/1.json
  def update
    respond_to do |format|
      if @checkingin.update(checkingin_params)
        format.html { redirect_to @checkingin, notice: 'Checkingin was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkingin }
      else
        format.html { render :edit }
        format.json { render json: @checkingin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkingins/1
  # DELETE /checkingins/1.json
  def destroy
    @checkingin.destroy
    respond_to do |format|
      format.html { redirect_to checkingins_url, notice: 'Checkingin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkingin
      @checkingin = Checkingin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkingin_params
      params.require(:checkingin).permit(:order_id)
    end
end
