class CreateWaitingListEntries < ActiveRecord::Migration
  def change
    create_table :waiting_list_entries do |t|

      t.timestamps
    end
  end
end
