class StaticController < ApplicationController
  def about_us
  end

  def kannada_culture
  end

  def about_member
  end

def contact

@contact_us = ContactUs.new(params[:contact_us])
@contact_us.save





end
  

def video_gallery   

end

end
