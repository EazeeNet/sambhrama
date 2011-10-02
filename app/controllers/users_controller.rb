class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @demographic=Demographic.new
    @home_address=Address.new(:home_id=>current_user.id)
    @business_address=Address.new(:business_id=>current_user.id)
  end

end
