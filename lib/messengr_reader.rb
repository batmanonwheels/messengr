require 'httparty'

def get_new_messages(last_message_id)
  response = HTTParty.get("http://messengr.herokuapp.com/messages.json", :query => { :last_message_id => last_message_id })
  return response.parsed_response
end

last_message_id = 0

last_message_id = 0
begin
  messages = get_new_messages(last_message_id)
  if messages.length > 0
    last_message_id = messages.last['id']
    messages.each do |message|
      puts "#{Time.parse(message["created_at"]).getlocal.strftime("%H:%M")} #{message["user"]}: #{message["text"]}"
    end
  end
  sleep(5)
end while true