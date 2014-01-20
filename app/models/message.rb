class Message < ActiveRecord::Base
  validates :user, obscenity: true, presence: true
  validates :text, obscenity: true, presence: true
end
