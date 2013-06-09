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

require 'spec_helper'

describe Experience do
  pending "add some examples to (or delete) #{__FILE__}"
end
