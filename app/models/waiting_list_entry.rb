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
  belongs_to :user
  # attr_accessible :title, :body
  validates :user, :event, :presence => true


end
