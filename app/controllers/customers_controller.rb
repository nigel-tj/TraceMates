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

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Successfully saved customer."
      render :action => 'index'
    else
      render :action => 'new'
    end
  end
  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:surname,:phone,:email,:address,:province,:city, :postal_code, :tracking_number)
  end

end
