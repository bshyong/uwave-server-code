    CONSUMER_KEY = "dPlPldlq8amr5DQDtkg"
    CONSUMER_SECRET = "wh5DCLJDuska4n5wyVcavWQlxlvYGOdWaf3aW7IUBQ"
     

class HomeController < ApplicationController
  
  def save_twitter
    session[:twitter] = params[:twitter]
    redirect_to :action => "index"
  end
  
  def index
    
  end
  
  def reset
    session[:twitter] = nil
    session[:phone] = nil
    redirect_to :root
  end
  
  
  def video
    
  end
  
  def tweet
    # consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, :site => "http://twitter.com")
    # request_token = consumer.get_request_token 
    # redirect_to request_token.authorize_url
       # oauth_verifier = "(a number shown on the user authorization screen)"
    #access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier )
    #token = access_token.token
    token = "375470983-zpwvMRxn52xPpT0MFwU0H2Mr6Xs2tXsZdJKn1vvy"
   # secret = access_token.secret
   secret = "NfveTAYkccJNpQ8PnMzfVzde2YQDybskdJqP1I"
     
    Twitter.configure do |config|
      config.consumer_key = CONSUMER_KEY
      config.consumer_secret = CONSUMER_SECRET
      config.oauth_token = token
      config.oauth_token_secret = secret 
    end
   # Twitter.update("Hello, World!")
   unless session[:twitter].nil?
    Twitter.update("Just cooked food for " + "@" + session[:twitter] + " #pennapps")
    end
    redirect_to :action => "index"
  end


end
