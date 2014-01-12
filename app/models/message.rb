class Message < ActiveRecord::Base
  validates :user,  obscenity: true
  validates :text,  obscenity: true
end
