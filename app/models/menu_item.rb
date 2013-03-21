# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MenuItem < ActiveRecord::Base
  attr_accessible :name, :type, :restaurant_id

  belongs_to :restaurant
end
