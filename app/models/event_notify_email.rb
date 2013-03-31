class EventNotifyEmail < ActiveRecord::Base
  attr_accessible :email_address, :event_id
end
