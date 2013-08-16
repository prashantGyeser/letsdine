# == Schema Information
#
# Table name: waiting_list_entries
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe WaitingListEntry do
  it {should belong_to(:event)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:event)}
end
