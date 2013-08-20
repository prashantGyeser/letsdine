require 'spec_helper'

describe EventDiscussion do
  it {should belong_to(:event)}
  it {should belong_to(:user)}
end
