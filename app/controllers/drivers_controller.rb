class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def create
    @driver = Driver.new(driver_params)
    uuid = UUID.new
    @driver_number = uuid.generate
    @driver.driver_id = @driver_number
    if @driver.save
      flash[:notice] = "Successfully saved driver."
      render :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  private
  def driver_params
    params.require(:driver).permit(:name,:surname,:phone,:email,:address,:province,:city, :postal_code,:driver_id, :bank_name, :branch_code, :account_holder, :account_number, :account_type  )
  end
  
end
