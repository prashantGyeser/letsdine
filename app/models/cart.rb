# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  seats         :integer
#  cost_per_seat :decimal(, )
#  user_id       :integer
#  attendee_id   :integer
#  event_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  purchased_at  :date
#

class Cart < ActiveRecord::Base
  attr_accessible :attendee_id, :cost_per_seat, :event_id, :seats, :user_id, :purchased_at

  def signature(stringToGetSignatureFrom)
  	return Base64.encode64(Digest::SHA1.hexdigest(stringToGetSignatureFrom).scan(/../).collect { |a| a.hex.chr }.join).chomp
  end

end
