require 'uuid'

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
