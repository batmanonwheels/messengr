require 'httparty'
require 'json'
require 'time'

MESSENGR_URL = ENV['PROD'] ? "http://messengr.herokuapp.com/messages.json" : "http://localhost:1999/messages.json"

def get_new_messages(last_message_id = 0)
  HTTParty.get(MESSENGR_URL, :query => { :last_message_id => last_message_id }).parsed_response
end

def format_time(time)
  Time.parse(time).getlocal.strftime("%H:%M")
end

puts "Welcome to Messengr"

last_message_id = 0

begin
  messages = get_new_messages(last_message_id)
  last_message_id = messages.last["id"] if messages.any?
  messages.each do |msg|
    puts "[At #{format_time(msg["created_at"])}] #{msg["user"].capitalize} says: #{msg["text"]}"
    puts "-"
  end
  sleep 2
end while true