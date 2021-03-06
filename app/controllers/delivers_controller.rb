# Delivers Controller
#
# Contains helper methods and code-behind for 'deliver' objects
# and their corresponding views and model

class DeliversController < ApplicationController
  before_action :set_deliver, only: [:show, :edit, :update, :destroy]

  # GET /delivers
  # GET /delivers.json
  def index
    @delivers = Deliver.all
  end

  # GET /delivers/1
  # GET /delivers/1.json
  def show
  end

  # GET /delivers/new
  def new
    @array = generate_orders_array
    @deliver = Deliver.new
  end

  def generate_orders_array
    checkingin_array = Checkingin.all
    array = Array.new
    checkingin_array.each do |order|
      if !Deliver.exists?(:order_id => order[:order_id])
        array.push(order[:order_id])
      end
    end
    return array
  end

  # GET /delivers/1/edit
  def edit
  end

  # POST /delivers
  # POST /delivers.json
  def create
    @deliver = Deliver.new(deliver_params)
    @deliver.signature = "Yes"
    respond_to do |format|
      if @deliver.save
        flash[:success] = "Deliver Process Submitted"
        format.html { redirect_to @deliver }
        format.json { render :show, status: :created, location: @deliver }
      else
        flash[:danger] = "Deliver Form failed, please check your input and make sure you've selected an order ID"
        format.html { redirect_to new_deliver_path }
        # format.html { render :new }
        # format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivers/1
  # PATCH/PUT /delivers/1.json
  def update
    respond_to do |format|
      if @deliver.update(deliver_params)
        format.html { redirect_to @deliver, notice: 'Deliver was successfully updated.' }
        format.json { render :show, status: :ok, location: @deliver }
      else
        format.html { render :edit }
        format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivers/1
  # DELETE /delivers/1.json
  def destroy
    @deliver.destroy
    respond_to do |format|
      format.html { redirect_to delivers_url, notice: 'Deliver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliver
      @deliver = Deliver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliver_params
      params.require(:deliver).permit(:order_id, :signature)
    end
end
