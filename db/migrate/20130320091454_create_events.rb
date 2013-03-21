class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_description
      t.date :event_date
      t.time :event_time
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
