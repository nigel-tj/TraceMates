class CustomersController < ApplicationController
  before_filter :set_customer_id, :only => [:new]
  
  def index
   @customers = Customer.all
  end

  def new
    @customer = Customer.new
    
  end

  def show
    @customer = Customer.find(params[:id])
    @parcels = Parcel.where(:customer_id => params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    #@tracker = Tracker.new
    #@tracker.tracker_id = @customer.tracking_number 
    uuid = UUID.new
    @client_number = uuid.generate
    @customer.customer_id = @client_number 
    
    if @customer.save
      flash[:notice] = "Successfully saved customer."
      render :action => 'index'
    else
      render :action => 'new'
    end
  end


  private
  def customer_params
    params.require(:customer).permit(:name,:surname,:phone,:email,:address,:province,:city, :postal_code, :tracking_number)
  end

  def set_customer_id
    uuid = UUID.new
    @client_number = uuid.generate
  end
end
