# == Schema Information
#
# Table name: event_discussions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe EventDiscussion do
  it {should belong_to(:event)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:comment)}
end
