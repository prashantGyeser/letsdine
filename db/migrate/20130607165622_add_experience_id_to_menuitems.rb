class AddExperienceIdToMenuitems < ActiveRecord::Migration
  def change
    add_column :menu_items, :experience_id, :integer
  end
end
