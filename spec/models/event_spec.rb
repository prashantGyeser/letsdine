# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  event_name        :string(255)
#  event_description :text
#  event_date        :date
#  event_time        :time
#  restaurant_id     :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_image       :string(255)
#  invitees          :text
#  user_id           :integer
#  max_seats         :integer
#  status            :string(255)
#  token             :string(255)
#  event_type        :string(255)
#  city              :string(255)
#  reminder          :string(255)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
