class AddEventIdToEventDiscussion < ActiveRecord::Migration
  def change
  	add_column :event_discussions, :event_id, :integer
  	add_column :event_discussions, :user_id, :integer
  	
  end
end
