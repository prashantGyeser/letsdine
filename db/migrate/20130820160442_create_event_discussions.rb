class CreateEventDiscussions < ActiveRecord::Migration
  def change
    create_table :event_discussions do |t|

      t.timestamps
    end
  end
end
