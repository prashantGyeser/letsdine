# == Schema Information
#
# Table name: waiting_list_entries
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WaitingListEntry < ActiveRecord::Base
  belongs_to :event
  belongs_to :attendee
  # attr_accessible :title, :body
  validates :attendee, :event, :presence => true


end
