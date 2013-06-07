# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  picture    :string(255)
#  about      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
end
