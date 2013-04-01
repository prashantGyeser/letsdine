# == Schema Information
#
# Table name: event_notify_emails
#
#  id            :integer          not null, primary key
#  email_address :string(255)
#  event_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class EventNotifyEmail < ActiveRecord::Base
  attr_accessible :email_address, :event_id
end
