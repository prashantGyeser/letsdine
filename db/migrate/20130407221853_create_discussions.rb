class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :user_id
      t.integer :group_id
      t.text :content

      t.timestamps
    end
  end
end
