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
  pending "add some examples to (or delete) #{__FILE__}"
end
