# == Schema Information
#
# Table name: user_invites
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  email_invites  :text
#  facebook_share :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_id       :integer
#

require 'spec_helper'

describe UserInvite do
  pending "add some examples to (or delete) #{__FILE__}"
end
