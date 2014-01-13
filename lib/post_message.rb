require 'httparty'
require 'json'

MESSENGR_URL = ENV['PROD'] ? "http://messengr.herokuapp.com/messages.json" : "http://localhost:1999/messages.json"

print "Welcome to Messengr, what's your username: "
@user = gets.chomp

def send_message(message)
  response = HTTParty.post(MESSENGR_URL, :query => { :user => @user, :text => message })

  puts response.parsed_response.inspect

  puts "ERROR: #{response.parsed_response['errors']}" if response.parsed_response["errors"]
end

begin
  print "Say something: "
  message = gets.chomp
  break if message == "quit"
  response = send_message(message)
end while true
