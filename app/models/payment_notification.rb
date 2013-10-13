# == Schema Information
#
# Table name: payment_notifications
#
#  id                :integer          not null, primary key
#  params            :text
#  cart_id           :integer
#  status            :string(255)
#  ref_id            :string(255)
#  error_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

# Todo: Remove the "create" field. I accidentally added this to the generator

class PaymentNotification < ActiveRecord::Base
  attr_accessible :cart_id, :create, :error_description, :params, :ref_id, :status

  belongs_to :cart

  # Serializing do that the data is stored in the database as yaml instead of a string so that it is still a hash.
  serialize :params

  after_create :mark_cart_as_purchased

  private
  def mark_cart_as_purchased

  	if status == "1"
  		cart.update_attribute(:purchased_at => Time.now.utc )
  	end

  end

end
