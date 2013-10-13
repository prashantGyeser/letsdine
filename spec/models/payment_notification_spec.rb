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

require 'spec_helper'

describe PaymentNotification do
  pending "add some examples to (or delete) #{__FILE__}"
end
