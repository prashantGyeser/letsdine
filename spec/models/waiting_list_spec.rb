# == Schema Information
#
# Table name: waiting_lists
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe WaitingList do
	it {should belong_to (:event)}
	it {should belong_to (:users)}
end
