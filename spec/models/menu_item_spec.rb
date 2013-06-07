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
#  experience_id :integer
#

require 'spec_helper'

describe MenuItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
