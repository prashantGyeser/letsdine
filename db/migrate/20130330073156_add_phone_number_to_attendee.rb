class AddPhoneNumberToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :phone_number, :string
  end
end
