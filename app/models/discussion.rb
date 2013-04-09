# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Discussion < ActiveRecord::Base
  attr_accessible :content, :group_id, :user_id

  validates :content, :presence => true
end
