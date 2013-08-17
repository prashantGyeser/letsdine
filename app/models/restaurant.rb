# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  cusine     :string(255)
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :integer
#  city       :string(255)
#  status     :string(255)
#

class Restaurant < ActiveRecord::Base
  attr_accessible :address, :cusine, :name, :photo, :menu_items_attributes, :price, :city, :commission_percentage

  has_many :menu_items, :dependent => :destroy
  has_many :events
  accepts_nested_attributes_for :menu_items, :allow_destroy => true

  mount_uploader :photo, PhotoUploader

  validates :commission_percentage, :presence => true
end
