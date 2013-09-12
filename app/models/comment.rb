# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :comment, :event_id, :user_id

  belongs_to :event
  belongs_to :user

  validate :comment, :presence => true
end
