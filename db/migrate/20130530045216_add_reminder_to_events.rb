class AddReminderToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reminder, :string
  end
end
