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
#

class Cart < ActiveRecord::Base
  attr_accessible :attendee_id, :cost_per_seat, :event_id, :seats, :user_id
end
