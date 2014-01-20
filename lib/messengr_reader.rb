require 'httparty'

def get_new_messages
  response = HTTParty.get("http://messengr.herokuapp.com/messages.json")
  return response.parsed_response
end

puts get_new_messages.inspect