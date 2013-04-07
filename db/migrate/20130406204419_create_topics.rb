class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :details
      t.integer :group_id

      t.timestamps
    end
  end
end
