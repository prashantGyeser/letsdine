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

require 'spec_helper'

describe EventNotifyEmail do
  pending "add some examples to (or delete) #{__FILE__}"
end
