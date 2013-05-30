# == Schema Information
#
# Table name: attendees
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  event_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  seats            :integer
#  phone_number     :string(255)
#  special_event_id :integer
#

class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :seats, :phone_number

  belongs_to :event

  validates :phone_number, :presence => true

  def self.total_joins_on(date)
    where("date(created_at) = ?", date).count
  end

  def self.total_attendees_this_month
  	where("created_at > ? and created_at < ?", Time.now.beginning_of_month.to_date, Time.now.end_of_month.to_date).count
  end

end
