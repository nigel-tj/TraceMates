require 'uuid'
require 'rest-client'
require 'json'

class ParcelsController < ApplicationController

  def index
    @parcels = Parcel.all
  end

  def new
    @customer_id = params[:customer_id]
    @customer = Customer.find(@customer_id)
    @parcel = Parcel.new
    
    uuid = UUID.new
    @tracking_number = uuid.generate
  end

  def show
    @parcel = Parcel.find(params[:id])
  end

  def edit
    @parcel = Parcel.find(params[:id])
  end

  def trace
    Parcel.where(:tracking_number => params[:id])
    response = RestClient.get 'http://tracemates.foodmates.co.za/services/rest/v1/tracemates.php', {params: {"function" => "get_tracker_locations", 'tracking_number' => '123456789'}}
    @data = JSON.parse(response.body)
    @locations = @data["data"]
  end
  
  
  def create
    @parcel = Parcel.new(parcel_params)

    uuid = UUID.new
    @tracking_number = uuid.generate
    @parcel.parcel_id = @tracking_number
    @parcel.customer_id = params[:parcel][:customer_id]
    if @parcel.save
      flash[:notice] = "Successfully saved parcel."
      render :action => 'index'
    else
      render :action => 'new'
    end
  end


  def update
    @parcel = Parcel.find(params[:id])
    if @parcel.update_attributes(parcel_params)
    # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  private
  def parcel_params
    params.require(:parcel).permit(:name,:parcel_details,:address,:province,:city, :postal_code, :tracking_number, :customer_id)
  end

end
