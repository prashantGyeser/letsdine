# == Schema Information
#
# Table name: waiting_lists
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WaitingList < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event
  belongs_to :users
end
