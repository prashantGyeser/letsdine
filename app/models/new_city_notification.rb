# == Schema Information
#
# Table name: new_city_notifications
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NewCityNotification < ActiveRecord::Base
  attr_accessible :city, :email
end
