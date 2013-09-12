# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  address               :string(255)
#  cusine                :string(255)
#  photo                 :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  price                 :integer
#  city                  :string(255)
#  status                :string(255)
#  commission_percentage :decimal(, )
#  latitude              :float
#  longitude             :float
#

require 'spec_helper'

describe Restaurant do
  it {should validate_presence_of(:commission_percentage)}
end
