# == Schema Information
#
# Table name: waiting_lists
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class WaitingList < ActiveRecord::Base
  # attr_accessible :title, :body
  # attr_accessible :user_id, :event_id
  belongs_to :event
  belongs_to :user
end
