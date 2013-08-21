# == Schema Information
#
# Table name: event_discussions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#  comment    :text
#

class EventDiscussion < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :event_id, :user_id, :comment

  belongs_to :event
  belongs_to :user

  validates :comment, :presence => true

end
