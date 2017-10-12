require "sinatra"
require 'sinatra/reloader' if development?
require 'dotenv-rails'
require 'twilio-ruby'
rake db:migrate
require_relative ./models/<some_model>
enable :sessions

@client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

configure :development do
  require 'dotenv'
  Dotenv.load
end

post "/analyze" do
  url = params[:url]
  puts url
  url
end

    #Amazon
    if body.include?("https://www.amazon.com/ap/register?openid.pape.max_auth_age=0&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&ignoreAuthState=1&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fyour-account%3Fref_%3Dnav_ya_signin&prevRID=5BGWN0VQ8AK78GMRSP77&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&prepopulatedLoginId=&failedSignInCount=0&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0")
        message = "At least six characters"

      #gmail
    elsif body.include?("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin")
        message =

      #netflix
    elsif body.include?("https://www.netflix.com/login")
      message =

      #Spotify
    elsif body.include?("https://www.spotify.com/us/signup/?ab=mbs")
      message =

      #facebook
    elsif body.include?("https://www.facebook.com/login.php?login_attempt=1&lwv=110")
      message =

      #Pandora
    elsif body.include?("https://www.pandora.com/account/sign-in")
      message =

      #Starbucks
    elsif body.include?("https://www.starbucks.com/account/signin")
      message =

      #Linkedin
    elsif body.include?("https://www.linkedin.com/m/login/")
      message =

      #Chegg
    elsif body.include?("https://www.chegg.com/auth?action=login&redirect=https%3A%2F%2Fwww.chegg.com%2F&reset_password=0")
      message =

      #Pinterest
    elsif body.include?("https://www.pinterest.com/login/?referrer=home_page")
      message =

      #itunes
    elsif body.include?("https://secure1.store.apple.com/shop/sign_in?c=aHR0cHM6Ly93d3cuYXBwbGUuY29tL3wxYW9zZTQyMmM4Y2NkMTc4NWJhN2U2ZDI2NWFmYWU3NWI4YTJhZGIyYzAwZQ&r=SCDHYHP7CY4H9XK2H&s=aHR0cHM6Ly93d3cuYXBwbGUuY29tL3wxYW9zZTQyMmM4Y2NkMTc4NWJhN2U2ZDI2NWFmYWU3NWI4YTJhZGIyYzAwZQ")
      message =

      #Venmo
    elsif body.include?("https://venmo.com/account/sign-in")
      message =

      #Paypal
    elsif body.include?("https://www.paypal.com/signin?country.x=US&locale.x=en_US")
      message =

      #Papa Johns
    elsif body.include?("https://www.papajohns.com/")
      message =

    else
      message = "Website not yet logged. Please log site."
    end

  end

#Need button on interface for [Change Password] and [Password Requirements] and [Display Character/Length]

if #change password is requested
  #if user input = what it should then move to next hint
  [#After getting all questions right will ask to provide associated email
  #Then will route to reset password]

  #if user input != hint then lockout of extension


if #choose password requirements
  [#post requirements]

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message do |m|
      m.body( message )
      unless media.nil?
        m.media( media )
      end
    end
  end
  content_type 'text/xml'
  twiml.to_s
end
