class ArduinoController < ApplicationController
  
  def start
    session[:time] = params[:time]
    User.last.update_attribute(:time, params[:time])
    redirect_to :root
  end

  def gettime
    
  end
  
  def finish
    text #if (!session[:phone].blank?) && (session[:text] == "true")
    tweet
    redirect_to :root
   # session[:time] = nil
  #  redirect_to :controller => 'home', :action => 'tweet'
  end

end
