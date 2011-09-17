require "twilio-ruby"
 
class TwilioController < ApplicationController
 
  # your Twilio authentication credentials
    ACCOUNT_SID = 'AC7f1be0408517f1883d7c79c4e82bc40e'
    ACCOUNT_TOKEN = 'a6f4780726c5934cd99de822afddfee5'
 
  # base URL of this application
  BASE_URL = "http://uwave.heroku.com"
 
  # Outgoing Caller ID you have previously validated with Twilio
    CALLER_ID = '4155992671'

  def index
  end
 
  # Use the Twilio REST API to initiate an outgoing call
  def initialize_text
    if !params['number']
      redirect_to :action => '.', 'msg' => 'Invalid phone number'
      return
    end
 
    # parameters sent to Twilio REST API
    data = {
      :from => CALLER_ID,
      :to => params['number'],
      :url => BASE_URL + '/text.xml',
    }
 
    begin

    client = Twilio::REST::Client.new(ACCOUNT_SID, ACCOUNT_TOKEN)
  #  client = Twilio::RestAccount.new('AC7f1be0408517f1883d7c79c4e82bc40e', 'a6f4780726c5934cd99de822afddfee5')
      client.account.sms.messages.create data
    rescue StandardError => bang
      redirect_to :action => '.', 'msg' => "Error #{bang}"
      return
    end
 
    redirect_to :action => '', 'msg' => "Calling #{params['number']}..."
  end
  end