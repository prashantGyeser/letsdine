# == Schema Information
#
# Table name: menu_items
#
#  id            :integer          not null, primary key
#  name          :text
#  course_name   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

class MenuItem < ActiveRecord::Base
  attr_accessible :name, :course_name, :restaurant_id

  belongs_to :restaurant
end
