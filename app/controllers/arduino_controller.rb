class ArduinoController < ApplicationController
  
  def start
    session[:time] = params[:time]
  end

  def gettime
    
  end
  
  def finish
    text if !session[:phone].blank? && session[:text] == true
    tweet
    session[:time] = nil
  #  redirect_to :controller => 'home', :action => 'tweet'
  end

end
