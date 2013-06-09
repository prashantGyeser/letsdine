# == Schema Information
#
# Table name: experiences
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  about              :text
#  address            :string(255)
#  city               :string(255)
#  cost               :integer
#  min_pax            :integer
#  experience_picture :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Experience < ActiveRecord::Base
  attr_accessible :about, :address, :city, :cost, :experience_picture, :min_pax, :name, :menu_items_attributes

  has_many :menu_items, :dependent => :destroy
  accepts_nested_attributes_for :menu_items, :allow_destroy => true
  
  mount_uploader :experience_picture, ExperiencePictureUploader
end
