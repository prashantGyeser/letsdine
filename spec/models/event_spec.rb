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
#  city              :string(255)
#  reminder          :string(255)
#  special           :string(255)
#  slug              :string(255)
#

require 'spec_helper'

describe Event do
	describe "seats_left" do 
		before do 
			@event = Event.new(:event_date => DateTime.now, :event_description => "Some long desc", :event_name => "An awesome event name", :event_time => DateTime.now, :restaurant_id => 1, :event_type => "open", :city => "Kuala Lumpur", :max_seats => 10)
			@event.save
		end

		it "should return 0 when all seats are filled" do
			Attendee.new(:event_id => @event.id, :phone_number => "9332432432432", :seats => 10).save
			@event.seats_left.should == 0
		end

		it "should return max seats when no seats are filled" do
			@event.seats_left.should == @event.max_seats
		end

		it "should correctly calculate the remaining seats when some seats are filled" do
			Attendee.new(:event_id => @event.id, :phone_number => "9332432432432", :seats => 4).save
			Attendee.new(:event_id => @event.id, :phone_number => "9332432432432", :seats => 2).save
			@event.seats_left.should == @event.max_seats - Attendee.where(:event_id => @event.id).pluck(:seats).sum
		end



	end
  
end
