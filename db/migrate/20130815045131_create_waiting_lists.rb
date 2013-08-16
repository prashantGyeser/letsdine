class CreateWaitingLists < ActiveRecord::Migration
  def change
    create_table :waiting_lists do |t|
    	t.references :event
      t.timestamps
    end
  end
end
