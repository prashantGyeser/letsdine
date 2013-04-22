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
#  status            :string(255)
#  token             :string(255)
#  event_type        :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_description, :event_name, :event_time, :restaurant_id, :event_image, :invitees, :max_seats, :status, :token, :event_type

  validates :event_date, :event_description, :event_name, :event_time, :restaurant_id, :event_type, :presence => true

  mount_uploader :event_image, EventImageUploader

  has_one :restaurant
  has_many :attendee, :dependent => :destroy

  before_create :generate_token

  protected

  def generate_token

  	logger.debug "The event type is:#{self.event_type}"
  	logger.debug "The event type is fdjkhgkdf:#{event_type}"
  	
  	if self.event_type == "private"
	  	self.token = loop do
			
				random_token = SecureRandom.urlsafe_base64
				break random_token unless Event.where(token: random_token).exists?
				  self.token = token	
			
	    end
    end
  end

end
