class StaticController < ApplicationController
  def about_us
  end

  def kannada_culture
  end

  def about_member
  end

def contact

@title = "Register"

if request.post? and params[:user]
@contact_us = ContactUs.new(params[:user])

if @contact_us.save

redirect_to :action => "index"
end
end
 

  end
  
  def video_gallery   

  end

end
