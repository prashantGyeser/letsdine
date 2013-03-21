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
#

class Restaurant < ActiveRecord::Base
  attr_accessible :address, :cusine, :name, :photo, :menu_items_attributes

  has_many :menu_items, :dependent => :destroy
  accepts_nested_attributes_for :menu_items
end
