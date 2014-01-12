class Message < ActiveRecord::Base
  attr_accessible :text, :user

  validates :user,  obscenity: true
  validates :text,  obscenity: true
end
