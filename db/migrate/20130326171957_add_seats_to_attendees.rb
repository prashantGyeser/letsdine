class AddSeatsToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :seats, :integer
  end
end
