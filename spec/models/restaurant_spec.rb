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
#

require 'spec_helper'

describe Restaurant do
  pending "add some examples to (or delete) #{__FILE__}"
end
