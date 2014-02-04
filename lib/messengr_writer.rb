require 'httparty'

@user = "edweng"

def send_message(message)
  response = HTTParty.post("http://messengr.herokuapp.com/messages", { :query => { :user => @user, :text => message } } )

  puts response.parsed_response.inspect

  puts "ERROR: #{response.parsed_response['errors']}" if response.parsed_response["errors"]
end

begin
  print "Say something: "
  message = gets.chomp
  if message != "quit"
    response = send_message(message)
  end
end while message != "quit"
