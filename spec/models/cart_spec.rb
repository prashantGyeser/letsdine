# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  seats         :integer
#  cost_per_seat :decimal(, )
#  user_id       :integer
#  attendee_id   :integer
#  event_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  purchased_at  :date
#

require 'spec_helper'

describe Cart do
  pending "add some examples to (or delete) #{__FILE__}"
end
