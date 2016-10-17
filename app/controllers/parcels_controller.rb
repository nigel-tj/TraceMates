require 'uuid'

class ParcelsController < ApplicationController

  def index
    @parcels = Parcel.all
  end

  def new
    @parcel = Parcel.new
    #uuid = UUID.new
    #@tracking_number = uuid.generate
  end

  def show
    @parcel = Parcel.find(params[:id])
  end
  
  def update
  end  
end
