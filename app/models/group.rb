class Group < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :group_image

  mount_uploader :group_image, GroupImageUploader
end
