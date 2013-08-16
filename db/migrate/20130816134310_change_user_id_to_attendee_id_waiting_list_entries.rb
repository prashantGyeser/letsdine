class ChangeUserIdToAttendeeIdWaitingListEntries < ActiveRecord::Migration
  def up
  	remove_column :waiting_list_entries, :user_id
  	add_column :waiting_list_entries, :attendee_id, :integer
  end

  def down
  	remove_column :waiting_list_entries, :attendee_id
  	add_column :waiting_list_entries, :user_id, :integer
  end
end
