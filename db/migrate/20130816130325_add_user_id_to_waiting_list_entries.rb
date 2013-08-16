class AddUserIdToWaitingListEntries < ActiveRecord::Migration
  def change
  	add_column :waiting_list_entries, :user_id, :integer
  	add_column :waiting_list_entries, :event_id, :integer
  end
end
