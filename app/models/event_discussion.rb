# == Schema Information
#
# Table name: event_discussions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventDiscussion < ActiveRecord::Base
  # attr_accessible :title, :body
end
