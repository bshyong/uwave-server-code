class HomeController < ApplicationController
  
  def save_info
    session[:twitter] = params[:twitter]
    session[:phone] = params[:phone]
    session[:text] = params[:text]
    session[:tweet] = params[:tweet]
    User.create(:twitter => params[:twitter], :phone => params[:phone], :text => params[:text])
    redirect_to :action => "index"
  end
  
  def index
    
  end
  
  def reset
    reset_session
    redirect_to :root
  end
  
end
