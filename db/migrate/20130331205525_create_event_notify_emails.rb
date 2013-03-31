class CreateEventNotifyEmails < ActiveRecord::Migration
  def change
    create_table :event_notify_emails do |t|
      t.string :email_address
      t.integer :event_id

      t.timestamps
    end
  end
end
