class Profile < ActiveRecord::Base
  attr_accessible :about, :picture, :user_id

  belongs_to :user
end
