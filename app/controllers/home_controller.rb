class HomeController < ApplicationController
  before_action :authenticate_admin!

  def map
    flash[:success ] = "Welcome to Trace Mates"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
  end

end
