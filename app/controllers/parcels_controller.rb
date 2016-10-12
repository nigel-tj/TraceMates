class ParcelsController < ApplicationController
  def index
    @parcels = Parcel.all
  end

  def new
    @parcel = Parcel.new
  end

  def show
    @parcel = Parcel.find(params[:id])
  end
  
  def update
  end  
end
