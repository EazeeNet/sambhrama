class HomeController < ApplicationController
  before_filter :authenticate_user! , :except=>['index']
  def index
  end
  
  def show
    @demographic=current_user.demographic|| Demographic.new
    @home_address=current_user.home_address
    @business_address=current_user.business_address
  end
  
  def create_update
    if current_user.demographic
      current_user.demographic.update_attributes(params[:demographic])
    else
      current_user.demographic=Demographic.new(params[:demographic]) 
    end
    if current_user.home_address
      current_user.home_address.update_attributes(params[:home_address])
    else
      homeadd=Address.new(params[:home_address])
      homeadd.home_id=current_user.id
      homeadd.save  
    end
    if current_user.home_address
      current_user.business_address.update_attributes(params[:business_address])
    else
      bussadd=Address.new(params[:business_address])
      bussadd.business_id=current_user.id
      bussadd.save 
    end    
    redirect_to :action=>'show'
  end

end
