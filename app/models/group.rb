# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_image :string(255)
#  category    :string(255)
#

class Group < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :group_image

  validates :name, :user_id, :presence => true

  mount_uploader :group_image, GroupImageUploader

  has_many :members
  has_many :discussions
end
