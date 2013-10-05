class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :seats
      t.decimal :cost_per_seat
      t.integer :user_id
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
