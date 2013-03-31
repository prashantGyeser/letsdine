# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  event_name        :string(255)
#  event_description :text
#  event_date        :date
#  event_time        :time
#  restaurant_id     :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_image       :string(255)
#  invitees          :text
#  user_id           :integer
#  max_seats         :integer
#

class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_description, :event_name, :event_time, :restaurant_id, :event_image, :invitees, :max_seats, :status

  validates :event_date, :event_description, :event_name, :event_time, :restaurant_id, :presence => true

  mount_uploader :event_image, EventImageUploader

  has_one :restaurant
  has_many :attendee, :dependent => :destroy
end
