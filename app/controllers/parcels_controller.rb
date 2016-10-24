require 'uuid'

class ParcelsController < ApplicationController

  def index
    @parcels = Parcel.all
  end

  def new
    @customer = Customer.find(params[:id])
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
    params.require(:parcel).permit(:name,:parcel_details,:address,:province,:city, :postal_code, :tracking_number, :custoner_id)
  end

end
