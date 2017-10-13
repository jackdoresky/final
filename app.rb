require "sinatra"
require 'sinatra/reloader' if development?
#require 'dotenv-rails'

enable :sessions

configure :development do
  require 'dotenv'
  Dotenv.load
end



get "/analyze" do
  url = params[:url]
  puts url
  get_password_hint url
end

post "/analyze" do
  url = params[:url]
  puts url
  get_password_hint url
end

def get_password_hint url

  if url.nil? or url.blank?
    return "You must provide a URL to find out what the password requirements are."
  end
  #Amazon
  if url.include?("https://www.amazon.com/ap/register?openid.pape.max_auth_age=0&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&ignoreAuthState=1&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fyour-account%3Fref_%3Dnav_ya_signin&prevRID=5BGWN0VQ8AK78GMRSP77&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&prepopulatedLoginId=&failedSignInCount=0&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0")
      message = "At least six characters"

    #gmail
  elsif url.include?("https://accounts.google.com/signin")
      message = "Use at least 8 characters"

    #netflix
  elsif url.include?("https://www.netflix.com/login")
    message = "Password should be between 4 and 50 characters"

    #Spotify
  elsif url.include?("https://www.spotify.com/us/signup/?ab=mbs")
    message = "Use at least 8 characters"

    #facebook
  elsif url.include?("https://www.facebook.com/login.php")
    message = "It should be longer than 6 characters, unique to you, and difficult for others to guess"

    #Pandora
  elsif url.include?("https://www.pandora.com/account/sign-in")
    message = "Your password must be at least 6 characters long"

    #Starbucks
  elsif url.include?("https://www.starbucks.com/account/signin")
    message = "•	From 8 to 25 characters
•	At least one number
•	At least one capital letter
•	At least one lowercase letter
•	At least one special character such as exclamation point or comma
"

    #Linkedin
  elsif url.include?("https://www.linkedin.com/m/login/")
    message = "6 or more characters"

    #Chegg
  elsif url.include?("https://www.chegg.com/auth?action=login&redirect=https%3A%2F%2Fwww.chegg.com%2F&reset_password=0")
    message = "•	At least 6 characters
•	Upper/lower case letters
•	Number or punctuation
"

    #Pinterest
  elsif url.include?("https://www.pinterest.com/login/?referrer=home_page")
    message = "You need 6+ characters"

    #itunes
  elsif url.include?("https://secure1.store.apple.com/shop/sign_in?c=aHR0cHM6Ly93d3cuYXBwbGUuY29tL3wxYW9zZTQyMmM4Y2NkMTc4NWJhN2U2ZDI2NWFmYWU3NWI4YTJhZGIyYzAwZQ&r=SCDHYHP7CY4H9XK2H&s=aHR0cHM6Ly93d3cuYXBwbGUuY29tL3wxYW9zZTQyMmM4Y2NkMTc4NWJhN2U2ZDI2NWFmYWU3NWI4YTJhZGIyYzAwZQ")
    message ="Your password must have:
8 or more characters
Upper and lowercase letters
At least one number
"

    #Venmo
  elsif url.include?("https://venmo.com/account/sign-in")
    message = "Must be 8 to 32 characters"

    #Paypal
  elsif url.include?("https://www.paypal.com/signin?country.x=US&locale.x=en_US")
    message = "8 characters or longer.
At least one number or symbol (like !@#$%^)
"

    #Papa Johns
  elsif url.include?("https://www.papajohns.com/")
    message = "•	At least 1 upper case letter
•	At least 1 lower case letter
•	At least 1 number
•	Be between 8 and 25 characters
•	At least 1 special character (Recommended)
•	Does not have 3 of the same character in a row (Recommended)
"

  else
    message = "Website not yet logged. Please log site."
  end

  return message

end


#Need button on interface for [Change Password] and [Password Requirements] and [Display Character/Length]

# if #change password is requested
#   #if user input = what it should then move to next hint
#   [#After getting all questions right will ask to provide associated email
#   #Then will route to reset password]
#
#   #if user input != hint then lockout of extension
#
#
# if #choose password requirements
#   [#post requirements]
#
#   twiml = Twilio::TwiML::MessagingResponse.new do |r|
#     r.message do |m|
#       m.body( message )
#       unless media.nil?
#         m.media( media )
#       end
#     end
#   end
#   content_type 'text/xml'
#   twiml.to_s
# end
