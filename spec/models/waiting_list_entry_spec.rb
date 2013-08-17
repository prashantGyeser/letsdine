# == Schema Information
#
# Table name: waiting_list_entries
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  attendee_id :integer
#

require 'spec_helper'

describe WaitingListEntry do
  it {should belong_to(:event)}
  it {should belong_to(:attendee)}
  it {should validate_presence_of(:attendee)}
  it {should validate_presence_of(:event)}
end
