# Requires httparty library...
require 'httparty'

# Posts a message to the website
HTTParty.post("http://messengr.herokuapp.com/messages",
  :query => {:text => "No you're not.", :user => "Michael"} )

# Gets the messages from the website
response = HTTParty.get("http://messengr.herokuapp.com/messages")
parsed_response = response.parsed_response
puts parsed_response.inspect