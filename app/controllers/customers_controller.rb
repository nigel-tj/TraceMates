class CustomersController < ApplicationController
 def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    uuid = UUID.new
    @tracking_number = uuid.generate
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def update
  end 
end
