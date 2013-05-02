class AddEventIdToUserInvite < ActiveRecord::Migration
  def change
    add_column :user_invites, :event_id, :integer
  end
end
