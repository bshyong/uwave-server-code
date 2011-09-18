 
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  #TWILIO
    ACCOUNT_SID = 'AC7f1be0408517f1883d7c79c4e82bc40e'
    ACCOUNT_TOKEN = 'a6f4780726c5934cd99de822afddfee5'
    CALLER_ID = '2155864260'
    
  #TWITTER
    CONSUMER_KEY = "iB2lO2A4Ki8urWxkgptaXQ"
    CONSUMER_SECRET = "JDyqq5MPX5suQvFxrJ2XLZekx8o7K4LXjAF3Al70SvE"
  
  def text

    data = {
      :from => CALLER_ID,
      :to => User.last.phone,
      :body => 'Your food is done!'
    }
 
   client = Twilio::REST::Client.new(ACCOUNT_SID, ACCOUNT_TOKEN)
   client.account.sms.messages.create data
 

  end
  
  def tweet
   require 'twitter'
   token = "375470983-zpwvMRxn52xPpT0MFwU0H2Mr6Xs2tXsZdJKn1vvy"
   secret = "NfveTAYkccJNpQ8PnMzfVzde2YQDybskdJqP1I"
     
    Twitter.configure do |config|
      config.consumer_key = CONSUMER_KEY
      config.consumer_secret = CONSUMER_SECRET
      config.oauth_token = token
      config.oauth_token_secret = secret 
    end
   unless User.last.twitter.nil?
    Twitter.update(User.last.twitter + " just @uwaved something " + "#pennapps")
    end
  end
  
end
