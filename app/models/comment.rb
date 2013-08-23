class Comment < ActiveRecord::Base
  attr_accessible :comment, :event_id, :user_id

  belongs_to :event
  belongs_to :user

  validate :comment, :presence => true
end
