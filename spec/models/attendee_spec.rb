# == Schema Information
#
# Table name: attendees
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  event_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  seats        :integer
#  phone_number :string(255)
#

require 'spec_helper'

describe Attendee do
  it {should have_many(:waiting_list_entries)}
  it {should have_many(:waiting_events).through(:waiting_list_entries)}
end
