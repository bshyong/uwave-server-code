# Twilio credentials
ACCOUNT_SID = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
ACCOUNT_TOKEN = 'YYYYYYYYYYYYYYYYYYYYYYYYYYYY'

# version of the Twilio REST API to use
API_VERSION = '2010-04-01'

# base URL of  application
BASE_URL =  "localhost:3000" #production ex: "http://appname.heroku.com/callme"

# Outgoing Caller ID you have previously validated with Twilio
CALLER_ID = 'XXX-XXX-XXXX'


class TwilioController < ApplicationController
    
    def initiate_text
      
       if !params['number']
              redirect_to({ :action => '.', 'msg' => 'Invalid phone number' })
              return
          end
          
          # parameters sent to Twilio REST API
          d = {
              'From' => CALLER_ID,
              'To' => params['number'],
              'Url' => BASE_URL + '/text.xml',
          }
          begin
              account = Twilio::RestAccount.new(ACCOUNT_SID, ACCOUNT_TOKEN)
              resp = account.request(
                  "/#{API_VERSION}/Accounts/#{ACCOUNT_SID}/Calls",
                  'POST', d)
              resp.error! unless resp.kind_of? Net::HTTPSuccess
          rescue StandardError => bang
              redirect_to({ :action => '.', 'msg' => "Error #{ bang }" })
              return
          end
          
          redirect_to({ :action => '', 'msg' => "Texting #{ params['number'] }..." })
    end
  
    def text
      @text_url = BASE_URL + '/text.xml'
      
      respond_to do |format|
        format.xml { @text_url }
        end
      end
    
  end