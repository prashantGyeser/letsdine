# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
end
