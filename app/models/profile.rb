# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  picture     :string(255)
#  about       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cover_photo :string(255)
#

class Profile < ActiveRecord::Base
  attr_accessible :about, :picture, :user_id

  belongs_to :user
end
