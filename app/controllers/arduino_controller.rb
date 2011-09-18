class ArduinoController < ApplicationController
  
  def start
    session[:time] = params[:time]
    User.last.update_attribute(:time, params[:time])
   # require "juggernaut"
   
   url = URI.parse('https://gdata.youtube.com/feeds/api/standardfeeds/on_the_web')
    
    
    Juggernaut.publish("channel1", "KHy7DGLTt8g")
    redirect_to :root
  end
  
  

  def gettime
    
  end
  
  def finish
    text if session[:text] = true
    tweet if session[:tweet] = true
    redirect_to :root
   # session[:time] = nil
  #  redirect_to :controller => 'home', :action => 'tweet'
  end

end
